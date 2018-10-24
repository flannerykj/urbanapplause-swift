//
//  File.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-10-23.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit


protocol SettingsRepresentable {
    var titleText: String { get }
    var accessoryType: UITableViewCellAccessoryType { get }
    
    func didSelect() -> ()
}
