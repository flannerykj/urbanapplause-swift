//
//  PostFormViewController.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-07-28.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit

class PostFormViewController: UIViewController {
    
    var post = Post(id: 0, image: "", date_posted: Date(), description: "", artist_id: 0, artist_name: "", username: "", user_id: 0)
    var selectedImage: UIImage?
    var imageName: String?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cityField: UITextField!
    
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var artistField: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    @IBAction func onPressSubmit(_ sender: UIButton) {
        if let image = self.imageName, let user = APISession.user {
            self.post.artist_id = 1
            self.post.image = image
            self.post.user_id = user.id
            self.post.username = user.email
            self.post.artist_name = self.artistField.text ?? "some artist"
            self.post.description = self.descriptionField.text ?? "some description"
            print(self.post)
            
    
        } else {
            print("ERROR: user not set")
        }
    }
    func onSuccess(data: Data) {
        let decoder = JSONDecoder()
        do {
            let apiResponse = try decoder.decode(APIResponse<DataContainer<Post>>.self, from: data)
            if let newPost = apiResponse.data?.results {
                for controller in self.navigationController!.viewControllers as Array {
                    if let vc = controller as? PostTableViewController {
                        vc.tableView.beginUpdates()
                        let newIndexPath = IndexPath(row: 0, section: 1)
                        vc.viewModel.posts += [newPost]
                        vc.tableView.insertRows(at: [newIndexPath], with: .automatic)
                        vc.tableView.cellForRow(at: newIndexPath)
                        vc.tableView.endUpdates()
                        self.navigationController!.popToViewController(vc, animated: true)
                        break
                    }
                }
                print("newPosts")
            } else {
                print("apiResponse")
            }
        } catch {
            print("unable to decode response")
            print(error)
        }
        self.tabBarController?.selectedIndex = 0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = selectedImage
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = false

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.tabBarController?.tabBar.isHidden = true
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
