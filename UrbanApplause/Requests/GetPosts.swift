//
//  GetPosts.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-07-29.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation

struct GetPosts: APIRequest {
    typealias Response = [Post]
    
    var path: String {
        return "/posts"
    }
    var scheme: HTTPScheme {
        return .get
    }
    var params: [String : Any]?
    var body: [String: Any]?
    
    // Parameters
    let name: String?
    let nameStartsWith: String?
    let limit: Int?
    let offset: Int?
    
    init(name: String? = nil,
         nameStartsWith: String? = nil,
         limit: Int? = nil,
         offset: Int? = nil) {
        self.name = name ?? nil
        self.nameStartsWith = nameStartsWith
        self.limit = limit
        self.offset = offset
    }
    
}
