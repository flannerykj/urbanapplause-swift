//
//  PostTableViewController.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-07-22.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit

class PostTableViewController: UITableViewController {
    
    var posts = [Post]()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        APIClient.getPosts() { data in
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
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            } catch {
                print("error trying to decode response")
                print(error)
                
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
        let post = posts[indexPath.row]
        if let url: URL = URL(string: "\(APIClient.baseURL)/uploads/\(post.image)") {
            print("URLLLLLLl: \(url)")
            cell.featuredImageView.load(url: url)
            cell.featuredImageView.contentMode = .scaleAspectFill
            cell.featuredImageView.clipsToBounds = true
        }
        cell.titleLabel.text = post.artist
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "PostDetail") as? PostDetailViewController {
            vc.selectedPost = posts[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
