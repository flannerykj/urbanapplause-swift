//
//  PostTableViewController.swift
//  UrbanApplause
//
//  Created by Flannery Jefferson on 2018-07-22.
//  Copyright © 2018 Flannery Jefferson. All rights reserved.
//

import UIKit

class PostTableViewController: UITableViewController {
    
    let viewModel = PostTableViewModel()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        initVM()
    }
    
    func initVM() {
        viewModel.reloadTableViewClosure = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        viewModel.initData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension PostTableViewController {

    // MARK: - TABLEVIEW METHODS
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberRows()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell
        let cellVM = viewModel.getCellViewModel(for: indexPath)
        if let url: URL = URL(string: "\(APIClient.baseURL)/uploads/\(cellVM.imageName)") {
            cell.featuredImageView.load(url: url)
            cell.featuredImageView.contentMode = .scaleAspectFill
            cell.featuredImageView.clipsToBounds = true
        }
        cell.titleLabel.text = cellVM.titleText
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.userPressed(indexPath: indexPath)
    }
}

extension PostTableViewController {
    // MARK: NAVIGATION
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PostDetailViewController {
            if let selected = viewModel.selectedPost {
                vc.selectedPost = selected
            }
        }
    }
}
