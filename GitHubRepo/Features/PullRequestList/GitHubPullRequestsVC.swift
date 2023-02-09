//
//  GitHubPullRequestsVC.swift
//  GitHubRepo
//
//  Created by Sushant Hegde on 09/02/23.
//

import UIKit

final class GitHubPullRequestsVC: UIViewController, UITableViewDelegate {
    
    private var pullRequestTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.isHidden = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PullRequestTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .red
        return tableView
    }()
        
    private var gitPullRequestViewModel: GitPullRequestViewModel?
    private var dataSource : PullRequestTableViewDataSource<PullRequestTableViewCell,GitHubPullRequest>!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        setupViewModel()
    }

    
    private func setupUI() {
        view.addSubview(pullRequestTableView)
        pullRequestTableView.delegate = self
        
        NSLayoutConstraint.activate([
            pullRequestTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            pullRequestTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            pullRequestTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            pullRequestTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
    }
    
    private func setupViewModel() {
        gitPullRequestViewModel = GitPullRequestViewModel()
        gitPullRequestViewModel?.fetchPullRequestList(onCompletion: { pullRequestData in
            print(pullRequestData)
            self.updateDataSource()
        })
    }
    
    func updateDataSource() {
        dataSource = PullRequestTableViewDataSource(cellIdentifier: "cell", items: gitPullRequestViewModel?.pullrequests ?? [], configureCell: { cell, pullRequestData in
            cell.updateData(data: pullRequestData)
        })
        
        DispatchQueue.main.async {
            self.pullRequestTableView.dataSource = self.dataSource
            self.pullRequestTableView.reloadData()
        }
        
    }

}
