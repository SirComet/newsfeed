//
//  ArticleRouter.swift
//  newsfeed
//
//  Created by Rafael de Paula on 26/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import UIKit

final class ArticleRouter {
    
    func show(at navigation: NavigationViewController, with item: FeedHighlight) {
        
        let controller = AppRoute.Article.viewController(viewControllerClass: ArticleTableViewController.self)
        let presenter = ArticlePresenter(view: controller, router: self, viewItem: item)
        controller.presenter = presenter
        
        navigation.show(controller, sender: nil)
    }
}
