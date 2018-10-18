//
//  ImageDetailViewController.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-07-28.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    //MARK: model
    var imageName: String?
    var navigationHidden: Bool = false
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        if let image = imageName, let url: URL = URL(string: "\(APIClient.baseURL)/uploads/\(image)") {
            imageView.load(url: url)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
        }
        self.navigationController?.hidesBarsOnTap = true

    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
}

