//
//  APIError.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-07-29.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation

/// Dumb error to model simple errors
/// In a real implementation this should be more exhaustive
public enum APIError: Error {
    case encoding
    case decoding
    case server(message: String)
}
