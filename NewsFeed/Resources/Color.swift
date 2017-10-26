//
//  Color.swift
//  newsfeed
//
//  Created by Rafael de Paula on 25/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import UIKit

enum Color {
    
    case main
    case categoryNFL
    case categoryNBA
    case categoryESports
    case categoryUFC
    
    var value: UIColor {
        switch self {
        case .main: return UIColor(hexadecimal: 0xCF0F28)
        case .categoryNFL: return UIColor(hexadecimal: 0x008975)
        case .categoryNBA: return UIColor(hexadecimal: 0xFF5733)
        case .categoryESports: return UIColor(hexadecimal: 0x87BA67)
        case .categoryUFC: return UIColor(hexadecimal: 0x581845)
        }
    }
}
