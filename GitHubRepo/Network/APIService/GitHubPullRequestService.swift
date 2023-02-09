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
    
    var methodPath: String {
        return "https://api.github.com/repos/hegdesushant07/GitHubRepoPullRequest/pulls"
    }
    
    func getAuthHeaders() -> [String : String] {
        ["Bearer":"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"]
    }
}
