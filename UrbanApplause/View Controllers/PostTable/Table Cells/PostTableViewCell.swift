//
//  PostTableViewCell.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-07-22.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    static let identifier = "PostCell"
    
    // MARK: UI Properties
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    
    // Table Cell methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func configure(with viewModel: PostCellViewModel) {
        featuredImageView.load(url: viewModel.imageUrl)
        titleLabel.text = viewModel.titleText
        subtitleLabel.text = viewModel.subtitleText
    }
}
