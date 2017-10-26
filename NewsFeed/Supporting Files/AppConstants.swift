//
//  AppConstants.swift
//  newsfeed
//
//  Created by Rafael de Paula on 25/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

enum AppConstants {
    
    case serviceHost
    case favoriteKey
    
    var value: String {
        switch self {
        case .serviceHost: return "https://private-2414c-newsfeed8.apiary-mock.com/"
        case .favoriteKey: return "favorites"
        }
    }
}
