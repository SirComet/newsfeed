//
//  VideoPresenter.swift
//  newsfeed
//
//  Created by Rafael Paula on 26/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import UIKit

final class VideoPresenter {
	
	fileprivate unowned var view: VideoViewProtocol
	fileprivate var router: VideoRouter
	let viewItem: FeedHighlight
	
	init(view: VideoViewProtocol, router: VideoRouter, viewItem: FeedHighlight) {
		self.view = view
		self.router = router
		self.viewItem = viewItem
	}
}

// MARK: - Public methods

extension VideoPresenter {
	
}
