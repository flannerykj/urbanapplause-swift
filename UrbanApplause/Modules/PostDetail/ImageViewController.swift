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
    var imageUrl: URL?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        if let url = imageUrl {
            imageView.load(url: url)
        }
    }
    
}

