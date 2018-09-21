//
//  AuthViewController.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-07-29.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit
import Alamofire

class SignupViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBAction func submit(_ sender: UIButton) {

        // A simple request with no parameters
        if let password = passwordField.text {
            if let email = emailField.text {
                APIClient.signup(email: email, password: password) { data in
                    let decoder = JSONDecoder()
                    do {
                        let apiResponse = try decoder.decode(APIResponse<AuthContainer>.self, from: data)
                        if let token = apiResponse.data?.token {
                            print("TOKEN: \(token)")
                        } else {
                            print(apiResponse)
                        }
                    } catch {
                        print("unable to decode response")
                    }
                }
            }
        }
        
    }
    func loginSuccess(result: DataResponse<DataContainer<Post>>) {
        
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
