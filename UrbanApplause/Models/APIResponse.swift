//
//  APIResponse.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-07-29.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation

struct APIResponse<Response: Decodable>: Decodable {
    let status: String?
    let message: String?
    let data: DataContainer<Response>?
}
