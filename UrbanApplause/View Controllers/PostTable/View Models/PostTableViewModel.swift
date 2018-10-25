//
//  PostTableViewMode.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-10-08.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation
import UIKit

class PostTableViewModel {
    var posts = [Post]()
    var selectedPost: Post?
    var postCellVMs = [PostCellViewModel]()
    
    var reloadTableViewClosure: (() -> ())?
    
    func fetchData() {
        print("fetching data!")
        apiProvider.request(.getPosts) { result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                // let statusCode = moyaResponse.statusCode
                self.success(data: data)
            // do something with the response data or statusCode
            case let .failure(error):
                // this means there was a network failure - either the request
                // wasn't sent (connectivity), or no response was received (server
                // timed out).  If the server responds with a 4xx or 5xx error, that
                // will be sent as a ".success"-ful response.
                print(error)
            }
        }
    }
    func success(data: Data) {
        
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
    
    func createCellViewModel(post: Post) -> PostCellViewModel {
        let cellVM = PostCellViewModel(post: post)
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
