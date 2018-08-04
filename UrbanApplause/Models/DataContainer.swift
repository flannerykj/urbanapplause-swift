//
//  DataContainer.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-07-29.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation

/// All successful responses return this, and contains all
/// the metainformation about the returned chunk.
public struct DataContainer<Results: Decodable>: Decodable {
    public let page: Int
    public let pageSize: Int
    public let total: Int
    public let results: Results
    
    public init(page: Int = 0,
                pageSize: Int = 0,
                total: Int = 0,
                results: Results) {
        self.page = page
        self.pageSize = pageSize
        self.total = total
        self.results = results
    }
}
