//
//  GitPullRequestViewModel.swift
//  GitHubRepo
//
//  Created by Sushant Hegde on 09/02/23.
//

import Foundation
import NetworkKit

class GitPullRequestViewModel {
    
    private(set) var pullrequests: [GitHubPullRequest] = []
    
    func fetchPullRequestList() {

        let resource = GitAPIResource()
        let request = APIRequest(resource: resource)
        
        request.execute { [weak self] requests in
            guard let self = self else { return }
            self.pullrequests = requests ?? []
            print(self.pullrequests)
        }
        
    }
    
    
    
}
