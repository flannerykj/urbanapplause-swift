//
//  UIColor.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-10-28.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit

extension UIColor {
    struct Shades {
        static var blackBis: UIColor { return UIColor(red: 18, green: 18, blue: 18) }
        static var blackTer: UIColor { return UIColor(red: 36, green: 36, blue: 36) }
        static var greyDarker: UIColor { return UIColor(red: 54, green: 54, blue: 54) }
        static var greyDark: UIColor { return UIColor(red: 74, green: 74, blue: 74) }
        static var greyLight: UIColor { return UIColor(red: 181, green: 181, blue: 181)}
        static var greyLighter: UIColor { return UIColor(red: 219, green: 219, blue: 219)}
        static var whiteTer: UIColor { return UIColor(red: 245, green: 245, blue: 245)}
        static var whiteBis: UIColor { return UIColor(red: 250, green: 250, blue: 250)}
    }
    
    struct ThemeColors {
        static var teal: UIColor { return UIColor(rgb: 0x07d0b2)}
        static var red: UIColor { return UIColor(rgb: 0xea094b)}
        static var darkBlue: UIColor { return UIColor(red: 50, green: 115, blue: 220)}
        static var lightBlue: UIColor { return UIColor(red: 32, green: 156, blue: 238)}
        static var green: UIColor { return UIColor(red: 35, green: 209, blue: 96)}
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
