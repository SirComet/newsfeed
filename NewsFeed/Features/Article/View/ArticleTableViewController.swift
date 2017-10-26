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
    
    @IBOutlet fileprivate weak var photoImageView: UIImageView!
    @IBOutlet fileprivate weak var headlineLabel: UILabel!
    @IBOutlet fileprivate weak var bodyTextLabel: UILabel!
    
    var presenter: ArticlePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        self.fillOutlets()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        
        self.tableView.estimatedRowHeight = 80
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.headlineLabel.textColor = .white
        self.bodyTextLabel.textColor = .white
    }
    
    fileprivate func fillOutlets() {
        
        guard let presenter = presenter else {
            fatalError("Presenter cannot be nil")
        }
        
        self.headlineLabel.text = presenter.viewItem.headline
        self.bodyTextLabel.text = presenter.viewItem.headline
        
        ImageCache.get(url: presenter.viewItem.thumb_url, success: { image in
            self.photoImageView.image = image
        })
    }
}
