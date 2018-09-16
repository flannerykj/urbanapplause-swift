//
//  AuthStorage.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-07-29.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation

class Session {
    
    // Singleton
    // can access outside class as Session.shared
    static let shared = Session()
    
    // private
    private var token: String?
    private var tokenExpiry: Date?
    
    let apiClient = APIClient()
    
    private init() {
    }
    
    // exposed getters & setters
    func setToken(token: String, expires: Date) {
        self.token = token
        self.tokenExpiry = expires
    }
    func getToken() -> String? {
        return self.token
    }
    func authenticated() -> Bool {
        if let _ = self.token {
            if !isTokenExpired() {
                return true
            }
        }
        return false
    }
    func isTokenExpired() -> Bool {
        if let expires = self.tokenExpiry {
            if expires > Date.init(timeIntervalSinceNow: 0) {
                return false
            }
        }
        return true
    }
    
}
