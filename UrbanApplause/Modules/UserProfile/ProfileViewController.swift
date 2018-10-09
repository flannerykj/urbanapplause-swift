//
//  ProfileViewController.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-09-17.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBAction func logoutButtonPressed(_ sender: Any) {
        APISession.endSession()
        let appDelegate = UIApplication.shared.delegate! as! AppDelegate
        let initialViewController = self.storyboard!.instantiateViewController(withIdentifier: "AuthNav")
        appDelegate.window?.rootViewController = initialViewController
        appDelegate.window?.makeKeyAndVisible()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
