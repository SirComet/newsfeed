//
//  FeedService.swift
//  newsfeed
//
//  Created by Rafael de Paula on 25/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import SwiftyJSON

final class FeedService {
    
    func getHighlights(success: @escaping ([FeedHighlight]) -> Void, fail: @escaping (_ error: RequestError) -> Void) {
        
        let serviceUrl = AppConstants.serviceHost.value.appending("highlights")
        
        RequestClient.sharedInstance
            .request(method: .get, url: serviceUrl, urlParameters: nil, parameters: nil, success: { result in
                success(FeedHighlight.parse(json: JSON(result).arrayValue))
            }, failure: { error in
                fail(error)
            })
    }
}
