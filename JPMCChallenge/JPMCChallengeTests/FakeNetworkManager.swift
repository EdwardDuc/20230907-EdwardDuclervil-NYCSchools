//
//  FakeNetworkManager.swift
//  JPMCChallengeTests
//
//  Created by Edward Duclervil on 9/8/23.
//

import Foundation
import Combine
@testable import JPMCChallenge

class FakeNetworkManager:NetworkProtocol {
    var mockPath = ""
    
    func getDataFromAPI<T>(urlRequest: RequestFields, type: T.Type) -> AnyPublisher<T, Error> where T : Decodable {
        let bundle = Bundle(for: FakeNetworkManager.self)
        
        guard let url = bundle.url(forResource: urlRequest.path, withExtension: "json") else{
            return Fail(error: NetworkError.badURLError).eraseToAnyPublisher()
        }
        do{
            let data = try Data(contentsOf: url)
            let list = try JSONDecoder().decode(type.self, from: data)
            return Just(list)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
            
        } catch {
            print(error.localizedDescription)
            return Fail(error:error).eraseToAnyPublisher()
        }
    }
    
    
}
