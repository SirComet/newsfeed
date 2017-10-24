//
//  UIViewControllerExtension.swift
//  newsfeed
//
//  Created by Rafael Paula on 24/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import UIKit

extension UIViewController {
	
	static func instantiate(fromAppRoute appRoute: AppRoute) -> Self {
		return appRoute.viewController(viewControllerClass: self)
	}
	
}
