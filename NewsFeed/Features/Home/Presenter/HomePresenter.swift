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
    fileprivate var service: FeedService
    
    fileprivate(set) var viewItems: [FeedHighlight] = []
	
	init(view: HomeViewProtocol, router: HomeRouter) {
		self.view = view
		self.router = router
        self.service = FeedService()
	}
}

// MARK: - Public methods

extension HomePresenter {
	
    func loadHighlights() {
        
        self.view.showLoading(message: "Carregando...")
        self.service.getHighlights(success: { highlights in
            self.viewItems.append(contentsOf: highlights)
            self.view.reloadTableView()
            self.view.hideLoading()
        }, fail: { error in
            self.view.showAlert(withTitle: "", message: "", buttonTitle: "OK")
            self.view.hideLoading()
        })
    }
    
    func saveFavorite(index: Int) {
        DefaultsManager.saveFavoriteNews(id: viewItems[index].id)
        self.view.reloadRow(at: index)
    }
}

// MARK: - Private methods

extension HomePresenter {
	
}
