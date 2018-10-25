//
//  PostRepresentable.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-10-25.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit

protocol PostRepresentable {
    var title: String { get }
    var subtitle: String { get }
    var image: UIImage { get }
}
