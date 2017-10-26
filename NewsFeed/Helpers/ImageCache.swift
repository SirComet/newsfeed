//
//  ImageCache.swift
//  newsfeed
//
//  Created by Rafael de Paula on 25/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import SwiftyJSON

struct ImageCache {
    
    static let cache = NSCache<NSString, UIImage>()
    
    static func get(url: String, success: @escaping (_ image: UIImage) -> Void) {
        
        if let cachedImage = cache.object(forKey: url as NSString) {
            return success(cachedImage)
        }
        
        RequestClient.sharedInstance.requestData(url: url, success: { image in
            guard let downloadedImage = UIImage(data: (image as! Data)) else {
                print("downloadedImage isn't a valid image")
                return
            }
            cache.setObject(downloadedImage, forKey: url as NSString)
            success(downloadedImage)
            
        }, failure: { error in
            print("Não foi possível carregar a imagem da URL: \(url)")
        })
    }
}

