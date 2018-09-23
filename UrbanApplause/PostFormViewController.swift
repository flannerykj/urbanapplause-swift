//
//  PostFormViewController.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-07-28.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit

class PostFormViewController: UIViewController {
    
    var post = Post()
    var selectedImage: UIImage?
    var imageName: String?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cityField: UITextField!
    
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var artistField: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    @IBAction func onPressSubmit(_ sender: UIButton) {
        if let image = self.imageName, let user = APISession.user {
            self.post.image = image
            self.post.artistId = 1
            self.post.userId = user.id
            self.post.username = user.username
            self.post.artist = self.artistField.text ?? "some artist"
            self.post.formattedAddress = self.cityField.text ?? "199 some address st, Toronto"
            self.post.description = self.descriptionField.text ?? "some description"
            
            APIClient.send(route: .addPost(post: self.post), success: onSuccess) { error in
                print("psot failured")
            }
    
        } else {
            print("ERROR: user not set")
        }
    }
    func onSuccess(data: Data) {
        print("success")
        self.tabBarController?.selectedIndex = 0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = selectedImage
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
