//
//  PullRequestsCellViewModel.swift
//  GitHubRepo
//
//  Created by Sushant Hegde on 09/02/23.
//

import Foundation

final class PullRequestsCellViewModel {    
    private(set) var title: String
    private(set) var number: Int
    private(set) var user: User
    private var closedDate: String
    
    init(data: GitHubPullRequest) {
        title = data.title
        number = data.number
        user = data.user
        closedDate = data.closedAt ?? ""
    }
    
    var closeDate: String {
        closedDate.toDate?.datelongMonthYear ?? ""
    }
    
}

