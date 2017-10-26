//
//  HomeItemViewCell.swift
//  newsfeed
//
//  Created by Rafael Paula on 24/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import UIKit

class HomeItemViewCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var headlineLabel: UILabel!
    @IBOutlet fileprivate weak var categoryLabel: UILabel!
    @IBOutlet fileprivate weak var thumbImage: UIImageView!
    @IBOutlet fileprivate(set) weak var favoriteButton: UIButton!
    @IBOutlet fileprivate(set) weak var shareButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillOutlets(with highlight: FeedHighlight) {
        self.headlineLabel.text = highlight.headline
        
        setBadgeCategory(category: highlight.category)
        setImage(url: highlight.thumb_url)
        setFavorite(id: highlight.id)
    }
    
    fileprivate func setImage(url: String) {
        ImageCache.get(url: url, success: { image in
            self.thumbImage.image = image
            self.thumbImage.alpha = 0.45
        })
    }
    
    fileprivate func setBadgeCategory(category: String) {
        
        self.categoryLabel.text = " \(category.uppercased()) "
        
        // FIXME: VERY UGLY!!
        if category.uppercased().contains("NFL") {
            self.categoryLabel.backgroundColor = Color.categoryNFL.value
        }
        else if category.uppercased().contains("NBA") {
            self.categoryLabel.backgroundColor = Color.categoryNBA.value
        }
        else if category.uppercased().contains("E-SPORTS") {
            self.categoryLabel.backgroundColor = Color.categoryESports.value
        }
        else if category.uppercased().contains("UFC") {
            self.categoryLabel.backgroundColor = Color.categoryUFC.value
        }
    }
    
    fileprivate func setFavorite(id: Int) {
        
        if DefaultsManager.isFavorite(id: id) {
            self.favoriteButton.setImage(#imageLiteral(resourceName: "iconFavoriteFill"), for: .normal)
            self.favoriteButton.tintColor = .white
        } else {
            self.favoriteButton.setImage(#imageLiteral(resourceName: "iconFavorite"), for: .normal)
            self.favoriteButton.tintColor = .white
        }
    }
}
