//
//  User.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-09-29.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation
public struct User: Codable {
    var id: Int
    var username: String?
    var email: String
    
    public init(id: Int, email: String, username: String) {
        self.id = id
        self.email = email
        self.username = username
    }
}
