//
//  VideoRouter.swift
//  newsfeed
//
//  Created by Rafael Paula on 26/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import UIKit

final class VideoRouter {
	
	func show(at navigation: NavigationViewController, with item: FeedHighlight) {
		
		let controller = AppRoute.Video.viewController(viewControllerClass: VideoViewController.self)
		let presenter = VideoPresenter(view: controller, router: self, viewItem: item)
		controller.presenter = presenter

		navigation.show(controller, sender: nil)
	}
}
