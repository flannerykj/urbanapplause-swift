//
//  AuthViewController.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-07-29.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit
import Alamofire
import PureLayout

class LoginViewController: UIViewController {
    var mainView: AppView!
    var authForm: AuthFormView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView = AppView(frame: CGRect.zero)
        
        
        authForm = AuthFormView(frame: CGRect.zero)
        authForm.submitButton.addTarget(self, action: #selector(submit), for: UIControlEvents.allTouchEvents)
        mainView.addContentSubview(authForm)
        self.view.addSubview(mainView)
        mainView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero)
        
        
        authForm.emailField.text = "flannj@gmail.com"
        authForm.passwordField.text = "cheesecake"
        // Do any additional setup after loading the view.
        APISession.getTokenFromKeychain()
        if APISession.isAuthenticated() {
            self.goToApp()
        }
    }
    
    @objc func submit(_ sender: UIButton) {
        print("try to submit")
        // A simple request with no parameters
        if let password = authForm.passwordField.text {
            if let email = authForm.emailField.text {
                // TODO: APi call to login
                self.goToApp()
                
            }
        }
        
    }
    
    func goToApp() {
        print("going to app")
        let appDelegate = UIApplication.shared.delegate! as! AppDelegate
        appDelegate.window?.rootViewController = Navigation.tabBarController
        appDelegate.window?.makeKeyAndVisible()
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
