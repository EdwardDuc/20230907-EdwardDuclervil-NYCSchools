//
//  NetworkProtocol.swift
//  JPMCChallenge
//
//  Created by Edward Duclervil on 9/7/23.
//

import Foundation
import Combine

protocol NetworkProtocol{
    func getDataFromAPI<T:Decodable>(urlRequest:RequestFields, type: T.Type) -> AnyPublisher<T,Error>
}
