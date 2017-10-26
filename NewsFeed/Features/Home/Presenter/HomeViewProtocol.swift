//
//  HomeViewProtocol.swift
//  newsfeed
//
//  Created by Rafael Paula on 24/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import UIKit

protocol HomeViewProtocol: class {
	
	func showLoading(message: String)
	func hideLoading()
    func reloadTableView()
    func reloadRow(at index: Int)
	func showAlert(withTitle title: String, message: String, buttonTitle: String)
}
