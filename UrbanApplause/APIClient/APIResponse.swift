//
//  APIResponse.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-09-08.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation

import Foundation

/// Top level response for every request to the Marvel API
/// Everything in the API seems to be optional, so we cannot rely on having values here
public struct APIResponse<Response: Decodable>: Decodable {
    /// Whether it was ok or not
    public let statusCode: Int?
    /// Message that usually gives more information about some error
    public let message: String?
    public let data: Response?

}
