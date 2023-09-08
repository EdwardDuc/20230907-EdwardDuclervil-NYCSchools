//
//  NetworkError.swift
//  JPMCChallenge
//
//  Created by Edward Duclervil on 9/7/23.
//

import Foundation

enum NetworkError:Error{
    case badURLError
    case noDataFoundError
    case dataParseError
    case responseError
}


extension NetworkError: LocalizedError, Equatable {
    var errorDescription: String?{
        switch self{
            
        case .badURLError:
            return NSLocalizedString("API Endpoint Error", comment: "Bad URL")
        case .noDataFoundError:
            return NSLocalizedString("Response Failure from  API endpoint", comment: "No Data Found")
        case .dataParseError:
            return NSLocalizedString("Failed to parse the response received from API Endpoint", comment: "Data Parse Error")
        case .responseError:
            return NSLocalizedString("Invalid Status Code recieved from API Endpoint", comment: "Response Error")
        }
    }
}
