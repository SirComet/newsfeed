//
//  RequestError.swift
//  newsfeed
//
//  Created by Rafael de Paula on 25/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import SwiftyJSON

struct RequestError {
    var httpStatusCode: Int?
    var apiCode: Int?
    var detail: String?
    var message: String?
    
    init(httpStatusCode: Int?, apiCode: Int? = nil, detail: String? = nil, message: String?) {
        self.httpStatusCode = httpStatusCode
        self.apiCode = apiCode
        self.detail = detail
        self.message = message
    }
}
