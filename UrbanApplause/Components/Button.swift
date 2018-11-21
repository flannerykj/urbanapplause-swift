//
//  Button.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-10-26.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit

class Button: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = UIColor.ThemeColors.teal

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
