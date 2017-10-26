//
//  ArticleItemViewCell.swift
//  newsfeed
//
//  Created by Rafael de Paula on 26/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import UIKit

class ArticleItemViewCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var headlineLabel: UILabel!
    @IBOutlet fileprivate weak var bodyTextLabel: UILabel!
    @IBOutlet fileprivate weak var thumbImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillOutlets(with highlight: FeedHighlight) {

        self.headlineLabel.text = highlight.headline
        self.headlineLabel.textColor = .white
        
        self.bodyTextLabel.text = highlight.body
        self.bodyTextLabel.textColor = .white
        
        setImage(url: highlight.thumb_url)
    }
    
    fileprivate func setImage(url: String) {
        ImageCache.get(url: url, success: { image in
            self.thumbImage.image = image
        })
    }
}
