//
//  PostCellViewModel.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-10-25.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit


struct PostCellViewModel {
    
    let post: Post
    
    var titleText: String {
        return post.artist_name
    }
    var subtitleText: String {
        let dateText = post.date_posted.getTimeSince()
        let usernameText = post.username ?? "Unknown"
        return "\(dateText) by \(usernameText)"
    }
    var imageUrl: URL {
        if let url = URL(string: "\(K.baseURL)/uploads/\(post.image)") {
            return url
        } else {
            return URL(fileReferenceLiteralResourceName: "placeholder_image")
        }
    }
}

