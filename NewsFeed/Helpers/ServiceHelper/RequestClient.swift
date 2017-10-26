//
//  RequestClient.swift
//  newsfeed
//
//  Created by Rafael de Paula on 25/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

final class RequestClient {
    static let sharedInstance: RequestClientProtocol = AlamofireRequestClient()
}
