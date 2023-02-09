//
//  ServiceManager.swift
//  GitHubRepo
//
//  Created by Sushant Hegde on 09/02/23.
//

import Foundation
import NetworkKit

protocol ServiceManagerProtocol {
    func fetchPullRequestList(for page: Int, onCompletion: @escaping ([GitHubPullRequest]) -> ())
}

final class ServiceManager: ServiceManagerProtocol {
    
    func fetchPullRequestList(for page: Int, onCompletion: @escaping ([GitHubPullRequest]) -> ()) {
        var resource = GitAPIResource()
        resource.methodPath += "page=\(page)&per_page=10"
        let request = APIRequest(resource: resource)

        request.execute { requests in
            onCompletion(requests ?? [])
        }
    }
    
}
