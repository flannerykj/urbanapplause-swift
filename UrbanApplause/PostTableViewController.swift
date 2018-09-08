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

        let apiClient = Session.shared.apiClient
        // A simple request with no parameters
        apiClient.send(GetPosts()) { response in
            print("\nGetPosts finished:")
            
            switch response {
            case .success(let dataContainer):
                for post in dataContainer.results {
                    print("  Artist: \(post.artist ?? "Unnamed character")")
                    print("  ImageUrl: \(post.imageUrl?.absoluteString ?? "None")")
                }
            case .failure(let error):
                print(error)
            }
        }
        
      
        /* if Session.shared.authenticated() {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewPost))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign In", style: .plain, target: self, action: #selector(showAuthModal))
        } */ 
    }
    @objc func addNewPost() {
        
    }
    @objc func showAuthModal() {
        print("showing auth modal")
        if let vc = storyboard?.instantiateViewController(withIdentifier: "AuthForm") as? AuthViewController {
            navigationController?.pushViewController(vc, animated: true)
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
        if let url = post.imageUrl {
            print(url)
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
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
