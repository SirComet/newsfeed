//
//  AlamofireRequestClient.swift
//  newsfeed
//
//  Created by Rafael de Paula on 25/10/17.
//  Copyright © 2017 Rafael Paula. All rights reserved.
//

import Alamofire

final class AlamofireRequestClient: RequestClientProtocol {
    
    func request(method: RequestHTTPMethod, url: String, urlParameters: [String : String]?, parameters: [String : Any]?,
                 success: @escaping (Any) -> Void, failure: @escaping (RequestError) -> Void) {
        
        switch method {
        case .get:
            Alamofire.request(url, method: .get, parameters: parameters ?? [:], encoding: URLEncoding.default, headers: nil).responseJSON { response in
                
                switch response.result {
                case .success:
                    success(response.value!)
                case .failure(let error):
                    failure(RequestError(httpStatusCode: response.response?.statusCode, message: error.localizedDescription))
                }
            }
            
        case .post:
            break
        }
    }
    
    func requestData(url: String, success: @escaping (Any) -> Void, failure: @escaping (RequestError) -> Void) {
        
        Alamofire.request(url).responseData { response in
            
            switch response.result {
            case .success:
                success(response.value!)
            case .failure(let error):
                failure(RequestError(httpStatusCode: response.response?.statusCode, message: error.localizedDescription))
            }
        }
    }
    
}
