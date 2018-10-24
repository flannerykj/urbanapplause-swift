//
//  SettingsTableViewCell.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-10-23.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    static let identifier: String = "SettingsCell"
    
    
    func configure(with viewModel: SettingsRepresentable) {
        titleLabel.text = viewModel.titleText
        accessoryType = viewModel.accessoryType
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
