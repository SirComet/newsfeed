//
//  AppDelegate.swift
//  newsfeed
//
//  Created by Rafael Paula on 24/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	var navigation: NavigationViewController? {
		return self.window?.rootViewController as? NavigationViewController
	}

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
		self.window = UIWindow(frame: UIScreen.main.bounds)
		self.prepareWindowRootViewController()
		
#if DEBUG
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last ?? "");
#endif
        
		return true
	}
}

// MARK: - Private methods

extension AppDelegate {
	
	fileprivate func prepareWindowRootViewController() {
		
		// Setting the navigation controller as root
		NavigationRouter.present(at: self.window)
		
		// Show home screen
		self.navigation?.presenter?.go(to: .Home)
	}
}
