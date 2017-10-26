//
//  VideoItemViewCell.swift
//  newsfeed
//
//  Created by Rafael Paula on 26/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import UIKit

class VideoItemViewCell: UITableViewCell {
	
	@IBOutlet fileprivate weak var headlineLabel: UILabel!
	@IBOutlet fileprivate weak var categoryLabel: UILabel!
	@IBOutlet fileprivate weak var thumbImage: UIImageView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	func fillOutlets(with related: FeedRelated) {
		
		self.headlineLabel.text = related.headline
		self.headlineLabel.textColor = .white
		
		self.categoryLabel.text = related.category.uppercased()
		self.categoryLabel.textColor = .white
		
		setImage(url: related.thumb_url)
	}
	
	fileprivate func setImage(url: String) {
		ImageCache.get(url: url, success: { image in
			self.thumbImage.image = image
		})
	}
}
