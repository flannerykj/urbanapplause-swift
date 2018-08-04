//
//  Post.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-07-22.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation

public struct Post: Codable {
    public var id: Int
    public var description: String?
    public var formattedAddress: String
    public var artist: String?
    public var artistId: Int
    public var username: String
    public var userId: Int
    public var imageUrl: URL?

    public enum Keys: String, CodingKey {
        case id
        case description
        case formattedAddress = "formatted_address"
        case artist
        case artistId = "artist_id"
        case username
        case userId = "user_id"
        case imageUrl = "image"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        
        self.id =  try container.decode(Int.self, forKey: .id)
        self.description = try container.decode(String.self, forKey: .description)
        self.formattedAddress = try container.decode(String.self, forKey: .formattedAddress)
        self.artist = try container.decode(String.self, forKey: .artist)
        self.artistId = try container.decode(Int.self, forKey: .artistId)
        self.username = try container.decode(String.self, forKey: .username)
        self.userId = try container.decode(Int.self, forKey: .userId)
        self.imageUrl = try container.decode(URL.self, forKey: .imageUrl)
    }
}




