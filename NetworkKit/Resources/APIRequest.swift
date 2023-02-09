//
//  APIRequest.swift
//  NetworkKit
//
//  Created by Sushant Hegde on 09/02/23.
//

import Foundation

public class APIRequest<Resource: APIResource> {
    public let resource: Resource
    
    public init(resource: Resource) {
        self.resource = resource
    }
}

extension APIRequest: NetworkRequest {
    public func decode(_ data: Data) -> [Resource.ModelType]? {
        let decoder = JSONDecoder()

        do {
            let data = try decoder.decode([Resource.ModelType].self, from: data)
            return data
        } catch {
            print(error)
        }
        return nil
    }
}
