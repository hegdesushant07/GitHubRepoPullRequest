//
//  APIResource.swift
//  NetworkKit
//
//  Created by Sushant Hegde on 09/02/23.
//

import Foundation

public protocol APIResource {
    associatedtype ModelType: Decodable
    var methodPath: String { get }
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

    private func getAuthHeaders() -> [String: String] {
        ["Bearer":"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"]
    }
    
}
