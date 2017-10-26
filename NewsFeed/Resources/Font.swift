//
//  Font.swift
//  newsfeed
//
//  Created by Rafael de Paula on 25/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import UIKit

enum Font {
    
    case regular
    case medium
    case bold
    case condensedBold
    
    var name: String {
        switch self {
        case .regular: return "HelveticaNeue"
        case .medium: return "HelveticaNeue-Medium"
        case .bold: return "HelveticaNeue-Bold"
        case .condensedBold: return "HelveticaNeue-CondensedBold"
        }
    }
}

