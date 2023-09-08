//
//  ScoreRequest.swift
//  JPMCChallenge
//
//  Created by Edward Duclervil on 9/7/23.
//

import Foundation

struct ScoreRequest:RequestFields {
    var path: String
    var params: [String : String]?
}
