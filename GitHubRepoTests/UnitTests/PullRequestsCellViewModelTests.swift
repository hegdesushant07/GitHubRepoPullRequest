//
//  PullRequestsCellViewModelTests.swift
//  GitHubRepoTests
//
//  Created by Sushant Hegde on 10/02/23.
//

import XCTest

@testable import GitHubRepo

final class PullRequestsCellViewModelTests: XCTestCase {

    private var viewModel: PullRequestsCellViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        guard let pathString = Bundle(for: ServiceManagerMock.self).path(forResource: "GitHubPullRequestMockResponse", ofType: "json"),
              let data = try? Data(contentsOf: URL(fileURLWithPath: pathString)) else {
                  return
        }

        let modelData = try? JSONDecoder().decode([GitHubPullRequest].self, from: data)[0]
        viewModel = PullRequestsCellViewModel(data: modelData!)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testModelData() {
        XCTAssertTrue(viewModel.title != "")
        XCTAssertTrue(viewModel.closeDate != "")
    }

}
