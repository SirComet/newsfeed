//
//  RequestClientProtocol.swift
//  newsfeed
//
//  Created by Rafael de Paula on 25/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

protocol RequestClientProtocol {
    func request(method: RequestHTTPMethod, url: String, urlParameters: [String : String]?, parameters: [String : Any]?, success: @escaping (Any) -> Void, failure: @escaping (RequestError) -> Void)
    func requestData(url: String, success: @escaping(Any) -> Void, failure: @escaping (RequestError) -> Void)
}
