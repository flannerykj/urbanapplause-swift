//
//  TextField.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-10-26.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit
import PureLayout

class TextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.borderStyle = UITextBorderStyle.roundedRect
        self.textColor = UIColor.Shades.greyDark
        
        // not working:
        // self.frame.size.height = 100
        
        if let superview = self.superview {
            self.autoPinEdge(.left, to: .left, of: superview)
            self.autoPinEdge(.right, to: .right, of: superview)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
