//
//  PostDetailViewController.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-07-27.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController {
    
    var selectedPost: Post?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.title = "Detail"
        if let post = selectedPost {
            if let url: URL = URL(string: "http://localhost:8080/api/uploads/\(post.image)") {
                imageView.load(url: url)
                imageView.contentMode = .scaleAspectFill
                imageView.clipsToBounds = true
            }
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTapImage))
            imageView.addGestureRecognizer(tapGestureRecognizer)
            artistLabel.text = post.artist_name
            title = "Post Detail"
        }
        setupNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigation()
    }
    func setupNavigation() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }

    @objc func onTapImage(sender: UITapGestureRecognizer) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ImageDetail") as? ImageViewController {
            if let image = selectedPost?.image {
                vc.imageName = image
                navigationController?.pushViewController(vc, animated: true)
            }
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}
