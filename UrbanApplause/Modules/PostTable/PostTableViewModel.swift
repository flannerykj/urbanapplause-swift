//
//  PostTableViewMode.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-10-08.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation

class PostTableViewModel {
    var posts = [Post]()
    var selectedPost: Post?
    var postCellVMs = [PostCellViewModel]()
    
    var reloadTableViewClosure: (() -> ())?
    
    func initData() {
        APIClient.getPosts { data in
            let dateFormatter = DateFormatter()
            dateFormatter.calendar = Calendar(identifier: .iso8601)
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            do {
                let apiResponse: APIResponse<DataContainer<Array<Post>>> = try decoder.decode(APIResponse<DataContainer<Array<Post>>>.self, from: data)
                
                if let posts = apiResponse.data?.results {
                    self.posts = posts
                    for post in posts {
                        let cellVM = self.createCellViewModel(post: post)
                        self.postCellVMs.append(cellVM)
                    }
                    self.reloadTableViewClosure?()
                }
            } catch {
                print("error trying to decode response")
                print(error)
            }
        }
    }
    
    func createCellViewModel(post: Post) -> PostCellViewModel {
        let dateText = ""
        
        let cellVM =  PostCellViewModel(titleText: post.artist_name, dateText: dateText, imageName: post.image)
        return cellVM
    }
    
    func getCellViewModel(for indexPath: IndexPath) -> PostCellViewModel {
        return postCellVMs[indexPath.row]
    }
    
    func getNumberRows() -> Int {
        return posts.count
    }
    func userPressed(indexPath: IndexPath) {
        selectedPost = posts[indexPath.row]
    }
    
}

struct PostCellViewModel {
    var titleText: String
    var dateText: String
    var imageName: String
    
}
