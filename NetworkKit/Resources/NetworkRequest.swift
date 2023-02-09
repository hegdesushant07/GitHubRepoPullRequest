//
//  NetworkRequest.swift
//  NetworkKit
//
//  Created by Sushant Hegde on 09/02/23.
//

import Foundation
import Alamofire

public protocol NetworkRequest: AnyObject {
    associatedtype ModelType
    func decode(_ data: Data) -> ModelType?
    func execute(withCompletion completion: @escaping (ModelType?) -> Void)
}

extension NetworkRequest {
    fileprivate func load(_ resource: any APIResource, withCompletion completion: @escaping (ModelType?) -> Void) {
        
        AF.request(resource.methodPath, headers: HTTPHeaders(resource.headers)).response { response in
            
            guard response.error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }

            guard let data = response.data, let value = self.decode(data) else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }

            DispatchQueue.main.async {
                completion(value)
            }
            
        }
    }
    
    
}
