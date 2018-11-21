//
//  PostTableViewCell.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-07-22.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit
import PureLayout

class PostTableViewCell: UITableViewCell {
    
    static let identifier = "PostCell"
    
    // MARK: UI Properties
    var card = PostCardView()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func configure(with viewModel: PostCellViewModel) {
        self.card.featuredImageView.load(url: viewModel.imageUrl)
        self.card.titleLabel.text = viewModel.titleText
        self.card.subtitleLabel.text = viewModel.subtitleText
        contentView.addSubview(card)
        card.autoPinEdgesToSuperviewEdges()
        
    }
}
