//
//  APIResource.swift
//  NetworkKit
//
//  Created by Sushant Hegde on 09/02/23.
//

import Foundation

public protocol APIResource {
    associatedtype ModelType: Decodable
    var methodPath: String { get set }
    func getAuthHeaders() -> [String: String]
}

extension APIResource {
    
    var headers: [String: String] {
        var headers = getBaseHeaders()
        headers.merge(getAuthHeaders()) { _, new in new }
        return headers
    }

    private func getBaseHeaders() -> [String: String] {
        ["Content-Type": "application/json"]
    }
    
}
