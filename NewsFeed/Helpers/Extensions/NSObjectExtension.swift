//
//  NSObjectExtension.swift
//  newsfeed
//
//  Created by Rafael Paula on 24/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import UIKit

protocol Identifying { }

extension Identifying where Self: NSObject {
	static var identifier: String { return String(describing: self) }
}

extension NSObject: Identifying { }
