//
//  NetworkManager.swift
//  JPMCChallenge
//
//  Created by Edward Duclervil on 9/7/23.
//

import Foundation
import Combine

class NetworkManager: NSObject, NetworkProtocol{
    func getDataFromAPI<T>(urlRequest: RequestFields, type: T.Type) -> AnyPublisher<T, Error> where T : Decodable {
        
        let urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        guard let request = urlRequest.createURLRequest() else {
            return Fail(error: NetworkError.badURLError).eraseToAnyPublisher()
        }
        return urlSession.dataTaskPublisher(for: request)
            .tryMap(
                { (data: Data, response: URLResponse) in
                    guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                        throw NetworkError.responseError
                    }
                    return data
                }
            )
            .decode(type: type.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    
}


extension NetworkManager: URLSessionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        //Create server trust
        guard let serverTrust = challenge.protectionSpace.serverTrust else {
            completionHandler(.cancelAuthenticationChallenge, nil)
            return
        }
        // SecTrustGetCertificateAtIndex was deprecated in iOS 15, so I provided two possibilities for older and newer Versions
        if #available(iOS 15.0, *) {
            //certificate
            //SecTrustCopyCertificateChain creates an Array of SecCertificate, so it needs to be mapped so it can be used,
            if let myCertificate = SecTrustCopyCertificateChain(serverTrust) as? [SecCertificate]{
                _ = Set(
                    myCertificate.map { SecCertificateCopyData($0) as Data }
                )
                
                //SSL Policy for domain name check
                let policy = NSMutableArray()
                policy.add(SecPolicyCreateSSL(true, challenge.protectionSpace.host as CFString))
                
                //evaluate server certificate
                let isServerTrusted = SecTrustEvaluateWithError(serverTrust, nil)
                let remoteServerCertificate: NSData = SecCertificateCopyData(myCertificate.first!)
                
                let pathToLocalCertificate = Bundle.main.path(forResource: "data.cityofnewyork.us", ofType: "cer")
                let localCertificate:NSData = NSData(contentsOfFile: pathToLocalCertificate!)!
                
                //comparison of server cert and local cert
                if (isServerTrusted && remoteServerCertificate.isEqual(to: localCertificate as Data)){
                    print("Certificate Match.")
                    print("Access Granted.")
                    completionHandler(.useCredential, nil)
                } else {
                    print("The certificate did not match and pinning failed.")
                    completionHandler(.cancelAuthenticationChallenge, nil)
                }
            }
        } else {
            //certificate
            let certificate = SecTrustGetCertificateAtIndex(serverTrust, 0)
      
            
            
            //SSL Policy for domain name check
            let policy = NSMutableArray()
            policy.add(SecPolicyCreateSSL(true, challenge.protectionSpace.host as CFString))
            
            //evaluate server certificate
            let isServerTrusted = SecTrustEvaluateWithError(serverTrust, nil)
            let remoteServerCertificate:NSData = SecCertificateCopyData(certificate!)
            
            
            let pathToLocalCertificate = Bundle.main.path(forResource: "data.cityofnewyork.us", ofType: "cer")
            let localCertificate:NSData = NSData(contentsOfFile: pathToLocalCertificate!)!
            
            //comparison of server cert and local cert
            if(isServerTrusted && remoteServerCertificate.isEqual(to: localCertificate as Data)){
                print("Certificate matched. Access Granted")
                completionHandler(.useCredential, nil)
                
            } else {
                print("The certificate did not match and pinning failed")
                completionHandler(.cancelAuthenticationChallenge, nil)
            }        }
    }
}
