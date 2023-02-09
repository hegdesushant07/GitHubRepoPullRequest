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

        var resource = GitAPIResource()
        let request = APIRequest(resource: resource)
        
        //"https://api.github.com/repos/apple/swift/pulls?state=closed&page=1&per_page=10"
        resource.methodPath += "?state=closed&page=\(currentPage)&per_page=10"
        
        request.execute { [weak self] requests in
            guard let self = self else { return }
            self.pullrequests = requests ?? []
            onCompletion(self.pullrequests)
        }
        
    }
        
}
