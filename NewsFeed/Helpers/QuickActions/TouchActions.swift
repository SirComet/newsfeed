//
//  TouchActions.swift
//  newsfeed
//
//  Created by Rafael Paula on 30/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

enum TouchActions: String {
	
	case favorites = "favorites"
	case search = "search"
	
	var route: AppRoute {
		switch self {
		case .favorites: return .Favorites
		case .search: return .Favorites
		}
	}	
}
