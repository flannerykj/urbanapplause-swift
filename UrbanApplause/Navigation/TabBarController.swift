//
//  TabBarController.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-10-28.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    static var shared = TabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVC = PostTableViewController()
        let homeNC = UINavigationController(rootViewController: homeVC)
        let homeTab = UITabBarItem(title: "Home", image: UIImage(named: "home"), tag: 0)
        homeNC.tabBarItem = homeTab
        
        let addPostVC = SelectPhotoViewController()
        let addPostNC = UINavigationController(rootViewController: addPostVC)
        let addPostTab = UITabBarItem(title: "Add", image: UIImage(named: "plus"), tag: 1)
        addPostNC.tabBarItem = addPostTab
        
        
        let profileVC = ProfileViewController()
        let profileNC = UINavigationController(rootViewController: profileVC)
        let profileTab = UITabBarItem(title: "Profile", image: UIImage(named: "user"), tag: 2)
        
        profileNC.tabBarItem = profileTab
        
        self.setViewControllers([homeNC, addPostNC, profileNC], animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
