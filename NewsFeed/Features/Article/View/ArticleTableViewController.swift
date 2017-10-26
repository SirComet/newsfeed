//
//  ArticleTableViewController.swift
//  newsfeed
//
//  Created by Rafael de Paula on 26/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import UIKit
import SVProgressHUD

class ArticleTableViewController: UITableViewController {
    
    var presenter: ArticlePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - Table view data source

extension ArticleTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let presenter = presenter else {
            fatalError("Presenter cannot be nil")
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleItemViewCell.identifier, for: indexPath) as! ArticleItemViewCell
        cell.fillOutlets(with: presenter.viewItem)
        
        return cell
    }
}

// MARK: - Protocol

extension ArticleTableViewController: ArticleViewProtocol {
    
    func showLoading(message: String) {
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setForegroundColor(.white)
        SVProgressHUD.setBackgroundColor(Color.main.value)
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.setFont(UIFont(name: Font.condensedBold.name, size: 15)!)
        SVProgressHUD.show(withStatus: message)
    }
    
    func hideLoading() {
        SVProgressHUD.dismiss()
    }
}

// MARK: - Private methods

extension ArticleTableViewController {
    
    fileprivate func setupLayout() {
        self.title = "NewsFeed"
        self.view.backgroundColor = .black
        
        self.tableView.estimatedRowHeight = 305
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
}
