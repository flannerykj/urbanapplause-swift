//
//  Artist.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-07-29.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation

public struct Artist: Decodable {
    var id: Int
    var name: String
    var description: String?
    var thumbnail: Image?
}

extension Artist {
    enum Keys: String, CodingKey {
        case id
        case name
    }
    
    init(fromJSON json: JSON) {
        self.id = Int(json["id"].stringValue)!
        self.name = json["name"].stringValue
    }
}
