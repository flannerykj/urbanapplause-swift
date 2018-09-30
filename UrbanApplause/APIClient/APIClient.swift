//
//  APIClient.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-09-14.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
    static let baseURL = "http://localhost:8080/api"
    
    static func send(route: APIRouter, decoder: JSONDecoder = JSONDecoder(), success:@escaping (_ response : Data)->(), failure : @escaping (_ error : Error)->()) {
        Alamofire.request(route).responseData { response in
                switch response.result {
                case .success:
                    if let data = response.data {
                        print("about to call success")
                        success(data)
                    }
                case .failure(let error):
                    print("FAILURE")
                    failure(error)
                }
        }
    }
    static func login(email: String, password: String, success:@escaping (_ response : Data)->()) {
        
        
        func loginSuccess(data: Data) {
            let dateFormatter = DateFormatter()
            dateFormatter.calendar = Calendar(identifier: .iso8601)
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            do {
                let apiResponse = try decoder.decode(APIResponse<AuthContainer>.self, from: data)
                if let token = apiResponse.data?.token, let expires = apiResponse.data?.expires, let user = apiResponse.data?.user {
                    print("TOKEN: \(token)")
                    print("USER: \(user)")
                    APISession.setToken(token: token, expires: expires, user: user)
                    APISession.user = user
                    success(data)
                } else {
                    print("apiResponse")
                }
            } catch {
                print("unable to decode response")
                print("error")
            }
        }
        send(route: APIRouter.login(email: email, password: password), success: loginSuccess, failure: failure)
    }
    
    static func signup(email: String, password: String, success:@escaping (_ response : Data)->()) {
        send(route: APIRouter.signup(email: email, password: password), success: success, failure: failure)
    }
    static func addPost(post: Post, success:@escaping (_ response : Data)->()) {
        print("post")
        send(route: APIRouter.addPost(post: post), success: success, failure: failure)
    }
    static func upload(image: UIImage, success:@escaping (_ response : Data)->()) {
        
    }
    
    static func failure(error: Error) {
        print("error")
    }
    static func getPosts(success:@escaping (_ response : Data)->()) {
        let jsonDecoder = JSONDecoder()
        send(route: APIRouter.getPosts, decoder: jsonDecoder, success: success, failure: failure)
    }
}
