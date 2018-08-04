//
//  LogIn.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-07-30.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation

struct LogIn: APIRequest {

    typealias Response = [String]
    var scheme: HTTPScheme {
        return .post
    }
    var path: String {
        return "/login"
    }
    var params: [String : Any]?
    var body: [String: Any]?
    
}
