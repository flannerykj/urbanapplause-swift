//
//  AuthViewController.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-07-29.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBAction func submit(_ sender: UIButton) {
        
        // A simple request with no parameters
        if let password = passwordField.text {
            if let email = emailField.text {
                APIClient.login(email: email, password: password) { data in
                    print("success here")
                    self.goToApp()
                }
            }
        }
        
    }
    func goToApp() {
        print("going to app")
        let appDelegate = UIApplication.shared.delegate! as! AppDelegate
        
        let initialViewController = self.storyboard!.instantiateViewController(withIdentifier: "TabBar")
        appDelegate.window?.rootViewController = initialViewController
        appDelegate.window?.makeKeyAndVisible()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailField.text = "flannj@gmail.com"
        passwordField.text = "cheesecake"
        // Do any additional setup after loading the view.
        APISession.getTokenFromKeychain()
        if APISession.isAuthenticated() {
            self.goToApp()
        }
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
