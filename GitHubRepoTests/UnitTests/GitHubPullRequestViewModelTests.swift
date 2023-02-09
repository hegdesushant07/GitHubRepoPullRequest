//
//  GitHubPullRequestViewModelTests.swift
//  GitHubRepoTests
//
//  Created by Sushant Hegde on 09/02/23.
//

import XCTest

@testable import GitHubRepo

final class GitHubPullRequestViewModelTests: XCTestCase {

    private var viewModel: GitPullRequestViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = GitPullRequestViewModel(serviceManager: ServiceManagerMock())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchPullRequest() {
        viewModel.fetchPullRequestList { requests in
            XCTAssertTrue(requests.count > 0)
            XCTAssertTrue(requests[0].title != "")
            
        }
    }
    
}
