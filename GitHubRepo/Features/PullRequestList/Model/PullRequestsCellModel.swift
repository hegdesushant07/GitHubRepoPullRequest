//
//  PullRequestsCellModel.swift
//  GitHubRepo
//
//  Created by Sushant Hegde on 09/02/23.
//

import Foundation

//MARK: Model for PullRequestTableViewCell
protocol PullRequestsCellModel {
    var title: String { get }
    var number: Int { get }
    var user: User { get }
    var closedDate: String { get }
}
