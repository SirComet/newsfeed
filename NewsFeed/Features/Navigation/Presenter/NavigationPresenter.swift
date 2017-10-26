//
//  NavigationPresenter.swift
//  newsfeed
//
//  Created by Rafael Paula on 24/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import UIKit

final class NavigationPresenter {
	
	fileprivate let appDelegate = UIApplication.shared.delegate as? AppDelegate
	fileprivate unowned let view: NavigationViewController
	
	init(view: NavigationViewController) {
		self.view = view
	}
}

// MARK: - Public methods

extension NavigationPresenter {
	
	func go(to route: AppRoute, with item: Any? = nil) {
		
		switch route {
		case .Home:
			HomeRouter().show(at: view)
			
		case .Favorites: break
            
		case .Article:
            ArticleRouter().show(at: view, with: item as! FeedHighlight)
            
		case .Video:
			VideoRouter().show(at: view, with: item as! FeedHighlight)
		}
	}
}
