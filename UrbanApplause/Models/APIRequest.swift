//
//  APIRequest.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-07-29.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation

public protocol APIRequest: Encodable {
   
    var scheme: HTTPScheme { get }
    var path: String { get }
    var params: [String: T] { get }
    // var body: [String: Any]? { get }
    
    associatedtype Response: Decodable
}


public enum HTTPScheme: String {
    case post = "POST"
    case get = "GET"
    case delete = "DELETE"
    case put = "PUT"
}
