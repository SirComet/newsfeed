//
//  HomeTableViewController.swift
//  newsfeed
//
//  Created by Rafael Paula on 24/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

	fileprivate var rowHeight = CGFloat(220)
	
	var presenter: HomePresenter?
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
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
        return 10
    }
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return rowHeight
	}

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeItemViewCell", for: indexPath)
		return cell
    }
	
}

// MARK: - Protocol

extension HomeTableViewController: HomeViewProtocol {
	
	func showLoading(message: String) {
		
	}
	
	func hideLoading() {
		
	}
	
	func showAlert(withTitle title: String, message: String, buttonTitle: String) {
		
	}
	
}
