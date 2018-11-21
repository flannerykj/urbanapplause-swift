//
//  UIFont.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-10-28.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit


extension UIFont {
    struct Types {
        static var h1: UIFont { return UIFont(name: "Avenir Next", size: 34) ?? UIFont() }
        static var h2: UIFont { return UIFont(name: "Avenir Next", size: 24) ?? UIFont() }
        static var h3: UIFont { return UIFont(name: "Avenir Next", size: 20) ?? UIFont() }
        static var body: UIFont { return UIFont(name: "Avenir Next", size: 16) ?? UIFont() }
    }
}
