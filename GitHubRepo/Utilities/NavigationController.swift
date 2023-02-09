//
//  NavigationController.swift
//  GitHubRepo
//
//  Created by Sushant Hegde on 09/02/23.
//

import Foundation
import UIKit
import NetworkKit

final class NavigationController {
    
    private static let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    static func pushToGitHubPullRequestVC() {
        let serviceManager = ServiceManager()
        let vc = GitHubPullRequestsVC(viewModel: GitPullRequestViewModel(serviceManager: serviceManager))
        let navigationcontroller = UINavigationController(rootViewController: vc)
        navigationcontroller.navigationBar.isHidden = true
        appDelegate.window?.rootViewController = navigationcontroller
        appDelegate.window?.makeKeyAndVisible()
    }
    
    
}
