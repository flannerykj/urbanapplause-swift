//
//  Post.swift
//  APIClient
//
//  Created by Flannery Jefferson on 2018-08-24.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation

public struct Post: Codable {
    public var id: Int
    public var date_posted: Date
    public var image: String
    public var description: String
    public var artist_id: Int
    public var artist_name: String
    public var username: String
    public var user_id: Int

    
    public init(id: Int, image: String, date_posted: Date, description: String, artist_id: Int, artist_name: String, username: String, user_id: Int) {
        self.id = id
        self.image = image
        self.date_posted = date_posted
        self.description = description
        self.artist_id = artist_id
        self.artist_name = artist_name
        self.username = username
        self.user_id =  user_id
    }
}
