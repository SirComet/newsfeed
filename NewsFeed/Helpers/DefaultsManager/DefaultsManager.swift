//
//  DefaultsManager.swift
//  newsfeed
//
//  Created by Rafael de Paula on 25/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import Foundation

struct DefaultsManager {
    
    fileprivate static let userDefaults = UserDefaults.standard
    
    static func saveFavoriteNews(id: Int) {
        var favorites = self.userDefaults.object(forKey: AppConstants.favoriteKey.value) as? [Int] ?? [Int]()
        
        if let favoriteIndex = favorites.index(of: id) {
            favorites.remove(at: favoriteIndex)
        } else {
            favorites.append(id)
        }
        self.saveValue(to: AppConstants.favoriteKey.value, value: favorites)
    }
    
    static func isFavorite(id: Int) -> Bool {
        let favorites = self.userDefaults.object(forKey: AppConstants.favoriteKey.value) as? [Int] ?? [Int]()
        return favorites.contains(id)
    }
    
    fileprivate static func saveValue(to key: String, value: Any) {
        userDefaults.set(value, forKey: key)
    }
}
