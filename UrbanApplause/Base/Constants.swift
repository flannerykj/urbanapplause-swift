//
//  Constants.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-09-14.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation

struct K {
    static let baseURL = "http://localhost:8080/api"
    
    struct DevelopmentServer {
        static let baseURL = "http://localhost:8080/api"
    }
    
    struct APIParameterKey {
        static let password = "password"
        static let email = "email"
        static let post = "post"
        static let images = "images"
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
