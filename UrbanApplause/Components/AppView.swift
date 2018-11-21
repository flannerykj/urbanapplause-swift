//
//  View.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-10-26.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit

class AppView: UIView {
    
    var safeView: UIView!
    var didSetupConstraints = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    func setup() {
        self.backgroundColor = UIColor.Shades.whiteBis
        safeView = UIView(frame: CGRect.zero)
        super.addSubview(safeView)
        safeView.autoPinEdgesToSuperviewSafeArea(with: UIEdgeInsets.zero)
    }
    override func addSubview(_ view: UIView) {
        safeView.addSubview(view)
        view.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero)
    }
    
    func addContentSubview(_ view: UIView) {
        let contentView = UIView(frame: CGRect.zero)
        
        contentView.addSubview(view)
        self.addSubview(contentView)
        
        view.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.init(top: 0, left: 16, bottom: 0, right: 16))
        contentView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }

    

}
