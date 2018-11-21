//
//  NetworkManager.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-09-18.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper


class NetworkManager {
    
    static let shared = NetworkManager()
    
    func makeRequest(request: URLRequest, completion: @escaping (Bool, Error?, Data?) -> Void) {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        session.dataTask(with: request) { data, urlResponse, error in
            if let error = error {
                print("request error")
                completion(false, error, data)
            } else {
                /* if let data = data {
                    // let json = try? JSONSerialization.jsonObject(with: data, options: [])
                    do {
                        let jsonData = try JSONSerialization.jsonObject(with: data) as! [String: Any]
                        // print(jsonData)
                    } catch {
                        print("couldn't serialize data")
                    }
                } else {
                    print("no data in response")
                } */
                completion(true, nil, data)
            }
        }.resume()
    }
}
