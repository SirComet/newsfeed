//
//  ArticleViewProtocol.swift
//  newsfeed
//
//  Created by Rafael de Paula on 26/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import UIKit

protocol ArticleViewProtocol: class {
    
    func showLoading(message: String)
    func hideLoading()
}
