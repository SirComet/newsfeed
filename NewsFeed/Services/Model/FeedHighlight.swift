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
	var video_url: String
    var share_url: String
    var headline: String
    var body: String
    var category: String
    var type: FeedType
	var related_content: [FeedRelated] = []
    
	init(id: Int, thumb_url: String, video_url: String, share_url: String, headline: String, body: String, category: String, type: FeedType, related_content: [FeedRelated]) {
        self.id = id
        self.thumb_url = thumb_url
		self.video_url = video_url
        self.share_url = share_url
        self.headline = headline
        self.body = body
        self.category = category
        self.type = type
		self.related_content = related_content
    }
}

// MARK: - Parse

extension FeedHighlight {
    
    static func parse(json: [JSON]) -> [FeedHighlight] {
        
        var highlights: [FeedHighlight] = []
        
        json.forEach { item in
            
            let id = item["id"].intValue
            let thumb_url = item["thumb_url"].stringValue
			let video_url = item["video_url"].stringValue
            let share_url = item["share_url"].stringValue
            let headline = item["headline"].stringValue
            let body = item["body"].stringValue
            let category = item["category"].stringValue
            let type = FeedType(rawValue: item["type"].stringValue)!
			let related_content = FeedRelated.parse(json: item["related_content"].arrayValue)
            
            highlights.append(FeedHighlight(id: id,
                                            thumb_url: thumb_url,
                                            video_url: video_url,
                                            share_url: share_url,
                                            headline: headline,
                                            body: body,
                                            category: category,
                                            type: type,
                                            related_content: related_content))
        }
        return highlights
    }
    
}
