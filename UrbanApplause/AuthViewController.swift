//
//  AuthViewController.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-07-29.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBAction func submit(_ sender: UIButton) {
        let apiClient = Session.shared.apiClient
        if let email = emailField.text {
            if let pwd = passwordField.text {
                let data = AuthForm(email: email, password: pwd)
            } else {
                print("please enter a password")
                return
            }
        } else {
            print("Please enter an email address")
            return
        }
        apiClient.send(LogIn()) { response in
            switch response {
            case .success(let dataContainer):
                
                DispatchQueue.main.async() {
                    print("success")
                    print(dataContainer.results)
                }
            case .failure(let error):
                print(error)
            }
        }
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
