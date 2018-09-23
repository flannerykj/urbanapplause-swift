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

            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTapImage))
            imageView.addGestureRecognizer(tapGestureRecognizer)
            artistLabel.text = post.artist
            title = "Post Detail"
            
        }
    }

    @objc func onTapImage(sender: UITapGestureRecognizer) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ImageDetail") as? ImageViewController {
            if let post = selectedPost {
                // vc.imageTitle = "Work by \(post.artist)"
               
            }
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}
