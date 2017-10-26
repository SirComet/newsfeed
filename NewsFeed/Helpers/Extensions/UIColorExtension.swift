//
//  UIColorExtension.swift
//  newsfeed
//
//  Created by Rafael de Paula on 25/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import UIKit

protocol Coloring { }

extension Coloring where Self: UIColor {
    
    init(red: Int, green: Int, blue: Int) {
        
        assert(red >= 0 && red <= 255, "Invalid Red component")
        assert(green >= 0 && green <= 255, "Invalid Green component")
        assert(blue >= 0 && blue <= 255, "Invalid Blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    init(hexadecimal: Int) {
        self.init(red:(hexadecimal >> 16) & 0xff, green:(hexadecimal >> 8) & 0xff, blue:hexadecimal & 0xff)
    }
}

extension UIColor : Coloring { }
