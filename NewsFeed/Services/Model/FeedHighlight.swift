//
//  FeedHighlight.swift
//  newsfeed
//
//  Created by Rafael de Paula on 25/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import SwiftyJSON

struct FeedHighlight {

    var id: Int
    var thumb_url: String
    var share_url: String
    var headline: String
    var category: String
    var type: String
    
    init(id: Int, thumb_url: String, share_url: String, headline: String, category: String, type: String) {
        self.id = id
        self.thumb_url = thumb_url
        self.share_url = share_url
        self.headline = headline
        self.category = category
        self.type = type
    }
}

// MARK: - Parse

extension FeedHighlight {
    
    static func parse(json: [JSON]) -> [FeedHighlight] {
        
        var highlights: [FeedHighlight] = []
        
        json.forEach { item in
            
            let id = item["id"].intValue
            let thumb_url = item["thumb_url"].stringValue
            let share_url = item["share_url"].stringValue
            let headline = item["headline"].stringValue
            let category = item["category"].stringValue
            let type = item["type"].stringValue
            
            highlights.append(FeedHighlight(id: id,
                                            thumb_url: thumb_url,
                                            share_url: share_url,
                                            headline: headline,
                                            category: category,
                                            type: type))
        }
        
        return highlights
    }
    
}
