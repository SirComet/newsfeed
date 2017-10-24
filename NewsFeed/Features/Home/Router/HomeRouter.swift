//
//  HomeRouter.swift
//  newsfeed
//
//  Created by Rafael Paula on 24/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import UIKit

final class HomeRouter {
	
	func show(at navigation: NavigationViewController) {
		
		let controller = AppRoute.Home.viewController(viewControllerClass: HomeTableViewController.self)
		let presenter = HomePresenter(view: controller, router: self)
		controller.presenter = presenter
		
		navigation.show(controller, sender: nil)
	}
}
