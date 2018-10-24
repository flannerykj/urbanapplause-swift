//
//  SettingsTableViewController.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-10-23.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//
import Foundation
import UIKit

class SettingsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SettingsTableViewController {

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return Section.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Section(rawValue: indexPath.section) else { fatalError() }
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier) as! SettingsTableViewCell
        var viewModel: SettingsRepresentable?
        switch section {
        case .languagePreference:
            if let languagePreference = LanguagePreference(rawValue: indexPath.row) {
                viewModel = SettingsViewLanguageViewModel(languagePreference: languagePreference)
            }
            if let viewModel = viewModel {
                cell.configure(with: viewModel)
            }
        
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let section = Section(rawValue: indexPath.section) else { fatalError() }
        var viewModel: SettingsRepresentable?
        
        switch section {
        case .languagePreference:
            if let languagePreference = LanguagePreference(rawValue: indexPath.row) {
                viewModel = SettingsViewLanguageViewModel(languagePreference: languagePreference)
            }
        }
        if let viewModel = viewModel {
            viewModel.didSelect()
            tableView.reloadData()
        }
    }
    
    private enum Section: Int {
        case languagePreference
        
        static let count: Int = {
            var max: Int = 0
            while let _ = Section(rawValue: max) { max += 1 }
            return max
        }()
    }
}
