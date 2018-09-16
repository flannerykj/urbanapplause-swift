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
    private static var token: String?
    private static var tokenExpiry: Date?
    
    @discardableResult
    static private func send(route: APIRouter, decoder: JSONDecoder = JSONDecoder(), success:@escaping (_ response : Data)->(), failure : @escaping (_ error : Error)->()) {
        Alamofire.request(route).responseData { response in
                switch response.result {
                case .success:
                    if let data = response.data {
                        success(data)
                    }
                case .failure(let error):
                    failure(error)
                }
        }
    }
    static func login(email: String, password: String, success:@escaping (_ response : Data)->()) {
        send(route: APIRouter.login(email: email, password: password), success: success, failure: failure)
    }
    
    static func failure(error: Error) {
        print(error)
    }
    static func getPosts(success:@escaping (_ response : Data)->()) {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .formatted(.postDateFormatter)
        send(route: APIRouter.getPosts, decoder: jsonDecoder, success: success, failure: failure)
    }
}

extension APIClient {

    // exposed getters & setters
    static func setToken(token: String, expires: Date) {
        self.token = token
        self.tokenExpiry = expires
    }
    static func getToken() -> String? {
        return self.token
    }
    static func authenticated() -> Bool {
        if let _ = self.token {
            if !isTokenExpired() {
                return true
            }
        }
        return false
    }
    static func isTokenExpired() -> Bool {
        if let expires = self.tokenExpiry {
            if expires > Date.init(timeIntervalSinceNow: 0) {
                return false
            }
        }
        return true
    }
}


