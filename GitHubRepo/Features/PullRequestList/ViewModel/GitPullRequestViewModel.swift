//
//  GitPullRequestViewModel.swift
//  GitHubRepo
//
//  Created by Sushant Hegde on 09/02/23.
//

import Foundation

final class GitPullRequestViewModel {
    
    private var serviceManager: ServiceManagerProtocol
    private(set) var pullrequests: [GitHubPullRequest] = []
    private var isLoading : Bool = false
    private var currentPage : Int = 1
    
    init(serviceManager: ServiceManagerProtocol) {
        self.serviceManager = serviceManager
    }
    
    /// fetchPullRequestList: Fetch pull requests data list
    /// - Parameter onCompletion: onCompletion returns the data model
    func fetchPullRequestList(onCompletion: @escaping ([GitHubPullRequest]) -> ()) {

        if !self.isLoading {
            self.isLoading = true
            
            print("Current PAge: \(currentPage)")
            
            serviceManager.fetchPullRequestList(for: currentPage) { pullrequests in
                self.pullrequests.append(contentsOf: pullrequests)
                if self.pullrequests.count > 0 {
                    self.currentPage += 1
                }
                onCompletion(self.pullrequests)
                self.isLoading = false
            }
        }
        
    }
        
}
