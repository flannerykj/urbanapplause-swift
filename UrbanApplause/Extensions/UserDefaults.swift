//
//  UserDefaults.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-10-23.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import Foundation

extension UserDefaults {
    static func getLanguagePreference() -> LanguagePreference {
        let storedValue = UserDefaults.standard.integer(forKey: UserDefaultKeys.languagePreference.rawValue)
        return LanguagePreference(rawValue: storedValue) ?? LanguagePreference.english
    }
    static func setLanguagePreference(languagePreference: LanguagePreference) {
        UserDefaults.standard.set(languagePreference.rawValue, forKey: UserDefaultKeys.languagePreference.rawValue)
    }
}

enum UserDefaultKeys: String {
    case languagePreference, notificationPreferences
}

enum LanguagePreference: Int {
    case english, french
}
