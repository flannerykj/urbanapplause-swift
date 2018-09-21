//
//  APIError.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-09-08.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation

public enum APIError: Error {
    case encoding
    case decoding
    case server(message: String)
}
