//
//  Request.swift
//  JPMCChallenge
//
//  Created by Edward Duclervil on 9/7/23.
//

import Foundation

protocol RequestFields{
    var baseURL:String{get}
    var path:String{get}
    var type: String{get}
    var header: [String:String]{get}
    var params: [String:String]?{get set}
    
    func createURLRequest() -> URLRequest?
}


extension RequestFields {
    var baseURL:String {
        return APIEndpoint.baseURL
    }
    var type: String{
        return ""
    }
    var header: [String:String]{
        return [:]
    }
    var params: [String:String]?{
        get {
            return [:]
        } set {}
    }
    
    func createURLRequest() -> URLRequest? {
        guard baseURL.count > 0, path.count > 0 else { return nil }
        var urlComponents = URLComponents(string: baseURL + path)
        var queryItems:[URLQueryItem] = []
        for(key,value) in params!{
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        urlComponents?.queryItems = queryItems
        
        guard let url = urlComponents?.url else {return nil}
        return URLRequest(url:url)
    }
    
}
