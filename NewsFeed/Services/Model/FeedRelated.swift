//
//  FeedRelated.swift
//  newsfeed
//
//  Created by Rafael Paula on 26/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import SwiftyJSON

struct FeedRelated {
	
	var id: Int
	var thumb_url: String
	var video_url: String
	var headline: String
	var category: String
	
	init(id: Int, thumb_url: String, video_url: String, headline: String, category: String) {
		self.id = id
		self.thumb_url = thumb_url
		self.video_url = video_url
		self.headline = headline
		self.category = category
	}
}

// MARK: - Parse

extension FeedRelated {
	
	static func parse(json: [JSON]) -> [FeedRelated] {
		
		var related: [FeedRelated] = []
		
		json.forEach { item in
			
			let id = item["id"].intValue
			let thumb_url = item["thumb_url"].stringValue
			let video_url = item["video_url"].stringValue
			let headline = item["headline"].stringValue
			let category = item["category"].stringValue
			
			related.append(FeedRelated(id: id,
			                           thumb_url: thumb_url,
			                           video_url: video_url,
			                           headline: headline,
			                           category: category))
		}
		return related
	}
}
