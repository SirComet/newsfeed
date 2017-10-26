//
//  ArticlePresenter.swift
//  newsfeed
//
//  Created by Rafael de Paula on 26/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import UIKit

final class ArticlePresenter {
    
    fileprivate unowned var view: ArticleViewProtocol
    fileprivate var router: ArticleRouter
    let viewItem: FeedHighlight
    
    init(view: ArticleViewProtocol, router: ArticleRouter, viewItem: FeedHighlight) {
        self.view = view
        self.router = router
        self.viewItem = viewItem
    }
}

// MARK: - Public methods

extension ArticlePresenter {
    
}
