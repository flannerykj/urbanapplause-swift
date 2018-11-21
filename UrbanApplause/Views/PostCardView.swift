//
//  AuthFormView.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-10-26.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit
import PureLayout
import Foundation

class PostCardView: UIView {
    
    var shouldSetupConstraints = true
    
    var stackView: UIStackView!
    var featuredImageView: UIImageView!
    var titleLabel: UILabel!
    var subtitleLabel: UILabel!
    
    
    let screenSize = UIScreen.main.bounds
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        featuredImageView = UIImageView()
        featuredImageView.contentMode = .scaleAspectFill
        featuredImageView.autoSetDimension(.height, toSize: 100)
        featuredImageView.clipsToBounds = true
        
        titleLabel = UILabel()
        titleLabel.font = UIFont.Types.h2
        titleLabel.text = "Card Title"
        subtitleLabel = UILabel()
        subtitleLabel.font = UIFont.Types.h3
        subtitleLabel.text = "Card Subtitle"
    
        stackView = UIStackView(arrangedSubviews: [featuredImageView, titleLabel, subtitleLabel])
        
        stackView.backgroundColor = .white
        stackView.axis = .vertical
        stackView.spacing = 5
    
        self.addSubview(stackView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func updateConstraints() {
        stackView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero, excludingEdge: .bottom)
        
        if(shouldSetupConstraints) {
            // AutoLayout constraints
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    
}
