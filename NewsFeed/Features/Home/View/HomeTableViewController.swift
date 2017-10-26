//
//  HomeTableViewController.swift
//  newsfeed
//
//  Created by Rafael Paula on 24/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import UIKit
import SVProgressHUD

class HomeTableViewController: UITableViewController {

	fileprivate var rowHeight = CGFloat(220)
	
	var presenter: HomePresenter?
	
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
		
		guard let presenter = presenter else {
			fatalError("Presenter cannot be nil")
		}
        presenter.loadHighlights()

        // Preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - Table view data source

extension HomeTableViewController {
	
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let presenter = presenter else {
            fatalError("Presenter cannot be nil")
        }
        return presenter.viewItems.count
    }
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return rowHeight
	}

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let presenter = presenter else {
            fatalError("Presenter cannot be nil")
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeItemViewCell.identifier, for: indexPath) as! HomeItemViewCell
        cell.fillOutlets(with: presenter.viewItems[indexPath.row])
        
        cell.shareButton.addTarget(self, action: #selector(shareHighlight(_:)), for: .touchUpInside)
        cell.shareButton.tag = indexPath.row
        
        cell.favoriteButton.addTarget(self, action: #selector(saveFavorite(_:)), for: .touchUpInside)
        cell.favoriteButton.tag = indexPath.row
        
		return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let presenter = presenter else {
            fatalError("Presenter cannot be nil")
        }
        presenter.selectViewItem(at: indexPath.row)
    }
}

// MARK: - Protocol

extension HomeTableViewController: HomeViewProtocol {
	
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
	
    func reloadTableView() {
        UIView.transition(with: self.tableView, duration: 0.35, options: .transitionCrossDissolve, animations: { self.tableView.reloadData() })
    }
    
    func reloadRow(at index: Int) {
        let indexPath = IndexPath(item: index, section: 0)
        self.tableView.reloadRows(at: [indexPath], with: .none)
    }
    
	func showAlert(withTitle title: String, message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
	}
}

// MARK: - Buttons actions

extension HomeTableViewController {
    
    @IBAction func shareHighlight(_ sender: UIButton) {
        
        guard let presenter = presenter else {
            fatalError("Presenter cannot be nil")
        }
        
        if let linkToShare = URL(string: presenter.viewItems[sender.tag].share_url) {
            let activity = UIActivityViewController(activityItems: [linkToShare], applicationActivities: nil)
            activity.excludedActivityTypes = [UIActivityType.airDrop, UIActivityType.addToReadingList, UIActivityType.openInIBooks]
            self.present(activity, animated: true, completion: nil)
        }
    }
    
    @IBAction func saveFavorite(_ sender: UIButton) {
        
        guard let presenter = presenter else {
            fatalError("Presenter cannot be nil")
        }
        presenter.saveFavorite(index: sender.tag)
    }
}

// MARK: - Private methods

extension HomeTableViewController {
    
    fileprivate func setupLayout() {
        self.title = "NewsFeed"
        self.view.backgroundColor = .black
    }
}
