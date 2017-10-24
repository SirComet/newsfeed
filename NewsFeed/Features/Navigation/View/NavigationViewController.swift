//
//  NavigationViewController.swift
//  newsfeed
//
//  Created by Rafael Paula on 24/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {
	
	var presenter: NavigationPresenter?
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.setupLayout()
	}
}

// MARK: - Private methods

extension NavigationViewController {
	
	fileprivate func setupLayout() {
		
	}
	
}
