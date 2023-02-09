//
//  GitPullRequestViewModel.swift
//  GitHubRepo
//
//  Created by Sushant Hegde on 09/02/23.
//

import Foundation
import NetworkKit

final class GitPullRequestViewModel {
    
    private(set) var pullrequests: [GitHubPullRequest] = []
    var currentPage : Int = 1
    var isLoading : Bool = false

    func fetchPullRequestList(onCompletion: @escaping ([GitHubPullRequest]) -> ()) {

        if !self.isLoading {
            self.isLoading = true
            
            print("Current PAge: \(currentPage)")
            
            var resource = GitAPIResource()
            resource.methodPath += "page=\(currentPage)&per_page=10"
            
            let request = APIRequest(resource: resource)

            request.execute { [weak self] requests in
                guard let self = self else { return }
                self.pullrequests.append(contentsOf: requests ?? [])
                if self.pullrequests.count > 0 {
                    self.currentPage += 1
                }
                onCompletion(self.pullrequests)
                self.isLoading = false
            }
        }
        
    }
        
}
