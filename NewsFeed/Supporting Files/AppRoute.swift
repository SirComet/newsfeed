//
//  AppRoute.swift
//  newsfeed
//
//  Created by Rafael Paula on 24/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import Foundation
import UIKit

enum AppRoute: String {
	
	case Home
	case Favorites
	case Article
	case Video
	
	var instance: UIStoryboard {
		return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
	}
	
	func viewController<T: UIViewController>(viewControllerClass: T.Type, function: String = #function, line: Int = #line, file: String = #file) -> T {

		let storyboardId = (viewControllerClass as UIViewController.Type).identifier
		guard let scene = instance.instantiateViewController(withIdentifier: storyboardId) as? T else {
			fatalError("ViewController with identifier \(storyboardId), not found in \(self.rawValue) Storyboard.\nFile: \(file) \nLine Number: \(line) \nFunction: \(function)")
		}

		return scene
	}
	
	func initialViewController() -> UIViewController? {
		return instance.instantiateInitialViewController()
	}
}
