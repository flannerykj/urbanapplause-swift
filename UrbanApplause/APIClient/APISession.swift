//
//  APISession.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-09-18.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper
import Moya

struct AuthKeychain: Codable {
    var token: String
    var tokenExpires: Date
    var user_id: Int
    var user_email: String
}

class APISession {
    
    private static var baseURL = URL(string: "localhost:8080/api")
    private static var token: String?
    private static var tokenExpiry: Date?
    static var user: User?
    
    
    static func setToken(token: String, expires: Date, user: User) {
        print(user)
        let auth = AuthKeychain(token: token, tokenExpires: expires, user_id: user.id, user_email: user.email)
        
        if let codedAuth = try? JSONEncoder().encode(auth) {
            print(codedAuth)
            let saved: Bool = KeychainWrapper.standard.set(codedAuth, forKey: "auth")
            if saved {
                print(" TOKEN EXPIRY SAVE: )")
            } else {
                print("NOT SAVED")
            }
        } else {
            print("COULDNT ENCODE EXPIRY DATE")
        }

        APISession.token = token
        APISession.tokenExpiry = tokenExpiry
        APISession.user = user
        
    }
    
    public static func getTokenFromKeychain() {
        print("CAALING FROM LOGIN")
        if let auth = KeychainWrapper.standard.string(forKey: "auth") {
            if let data = auth.data(using: .utf8) {
                print(auth)
                if let decodedAuth = try? JSONDecoder().decode(AuthKeychain.self, from: data) {
                    print("TRYING TO DECODE ")
                    self.token = decodedAuth.token
                    self.tokenExpiry = decodedAuth.tokenExpires
                    self.user = User(id: decodedAuth.user_id, email: decodedAuth.user_email, username: "")
                    print("success, token is: \(decodedAuth.token), expiry is: \(decodedAuth.tokenExpires)")
                    print(APISession.isAuthenticated())
                } else {
                    print("couldn't decode")
                }
            } else {
                print ("couldnt conver to data")
            }
        } else {
            print("couldn't get auth date from keychain")
        }
    }
    
    public static func getToken() -> String? {
        if isAuthenticated() {
            return APISession.token
        }
        return nil
    }
    
    public static func endSession() {
        if let _ = KeychainWrapper.standard.string(forKey: "auth") {
            let success = KeychainWrapper.standard.removeObject(forKey: "auth")
            if success {
                APISession.token = nil
                APISession.tokenExpiry = nil
                
            }
        }
    }
    
    public static func isAuthenticated() -> Bool {
        
        if let _ = APISession.token, let expiry = APISession.tokenExpiry {
            print("current date is: \(Date())")
            if (Date() < expiry) {
                return true
            }
        }
        return false
    }
}
