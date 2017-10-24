//
//  HomePresenter.swift
//  newsfeed
//
//  Created by Rafael Paula on 24/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import UIKit

final class HomePresenter {
	
	fileprivate unowned var view: HomeViewProtocol
	fileprivate var router: HomeRouter
	
	init(view: HomeViewProtocol, router: HomeRouter) {
		self.view = view
		self.router = router
	}
}

// MARK: - Public methods

extension HomePresenter {
	
}

// MARK: - Private methods

extension HomePresenter {
	
}
