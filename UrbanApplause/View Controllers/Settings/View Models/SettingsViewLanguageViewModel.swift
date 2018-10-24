//
//  SettingsViewLanguageViewModel.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-10-23.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit

struct SettingsViewLanguageViewModel: SettingsRepresentable {

    let languagePreference: LanguagePreference
    
    var titleText: String {
        switch languagePreference {
        case .english:
            return "Engligh"
        case .french:
            return "French"
        }
    }
    
    var accessoryType: UITableViewCellAccessoryType {
        if UserDefaults.getLanguagePreference().rawValue == languagePreference.rawValue {
            return .checkmark
        }
        return .none
    }
    
    func didSelect() {
        UserDefaults.setLanguagePreference(languagePreference: languagePreference)
    }
}
