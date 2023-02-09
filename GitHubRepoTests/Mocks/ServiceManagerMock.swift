//
//  ServiceManagerMock.swift
//  GitHubRepoTests
//
//  Created by Sushant Hegde on 09/02/23.
//

import Foundation

@testable import GitHubRepo

final class ServiceManagerMock: ServiceManagerProtocol {
    
    func fetchPullRequestList(for page: Int, onCompletion: @escaping ([GitHubRepo.GitHubPullRequest]) -> ()) {
                
        guard let pathString = Bundle(for: ServiceManagerMock.self).path(forResource: "GitHubPullRequestMockResponse", ofType: "json"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: pathString)) else {
                  return
        }

        let modelData = try? JSONDecoder().decode([GitHubPullRequest].self, from: data)
        onCompletion(modelData ?? [])
    }
    
}
