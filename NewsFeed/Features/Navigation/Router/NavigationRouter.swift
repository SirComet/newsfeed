//
//  NavigationRouter.swift
//  newsfeed
//
//  Created by Rafael Paula on 24/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import UIKit

final class NavigationRouter {
	
	class func present(at window: UIWindow?) {
		
		let viewController = NavigationViewController()
		let presenter = NavigationPresenter(view: viewController)
		viewController.presenter = presenter

		window?.rootViewController = viewController
	}
}
