//
//  Result.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-07-29.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}

public typealias ResultCallback<Value> = (Result<Value>) -> Void
