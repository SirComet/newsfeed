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
		
		let titleAttributes = [NSFontAttributeName: UIFont(name: Font.condensedBold.name, size: 18)!,
		                       NSForegroundColorAttributeName: UIColor.white]
		
		let buttonAttributes = [NSForegroundColorAttributeName: UIColor.clear, NSFontAttributeName: UIFont.systemFont(ofSize: 0.01)]
		
        self.navigationBar.tintColor = .white
        self.navigationBar.barTintColor = Color.main.value
        self.navigationBar.titleTextAttributes = titleAttributes
		
		UIBarButtonItem.appearance(whenContainedInInstancesOf: [NavigationViewController.self]).setTitleTextAttributes(buttonAttributes, for: .normal)
		UIBarButtonItem.appearance(whenContainedInInstancesOf: [NavigationViewController.self]).setTitleTextAttributes(buttonAttributes, for: .highlighted)
	}
}
