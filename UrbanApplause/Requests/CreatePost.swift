//
//  CreatePost.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-07-31.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation


struct CreatePost: APIRequest {
    typealias Response = [Post]
    
    var path: String {
        return "/posts"
    }
    var scheme: HTTPScheme {
        return .post
    }
    var params: [String : Any]?
    var body: [String : Any]?
    
    init(post: Post) {
        body = ["post": post]
    }
    
}
