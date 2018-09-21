//
//  APISession.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-09-18.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation

class APISession {
    
    private static var baseURL = URL(string: "localhost:8000/api")
    private static var token: String?
    private static var tokenExpiry: Date?
    static var userId: Int?
    
    private static var sharedNetworkManager: APISession = {
        return APISession()
    }()
    
    static class func shared() -> APISession {
        return sharedNetworkManager
    }
    
    static func setToken(token: String, expires: Date) {
        APISession.token = token
    }
    
    static func getToken() -> String? {
        if isAuthenticated() {
            return APISession.token
        }
        return nil
    }
    
    static func isAuthenticated() -> Bool {
        if let _ = APISession.token, let expiry = APISession.tokenExpiry {
            if (expiry < Date()) {
                return true
            }
        }
        return false
    }
}
