//
//  GitHubPullRequestService.swift
//  GitHubRepo
//
//  Created by Sushant Hegde on 09/02/23.
//

import Foundation
import NetworkKit

// Request
struct GitAPIResource: APIResource {
    typealias ModelType = GitHubPullRequest
    
    var methodPath: String = "https://api.github.com/repos/apple/swift/pulls"
    
//    var methodPath: String {
////        "https://api.github.com/repos/apple/swift/pulls?page=1&per_page=10"
////        "https://api.github.com/repos/apple/swift/pulls?state=closed&page=1&per_page=10"
//    }
    
    func getAuthHeaders() -> [String : String] {
        [:]
    }
}
