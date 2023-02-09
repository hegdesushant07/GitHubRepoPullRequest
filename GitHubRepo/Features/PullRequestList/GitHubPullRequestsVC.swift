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
        tableView.backgroundColor = .white
        return tableView
    }()
        
    private var gitPullRequestViewModel: GitPullRequestViewModel?
    private var dataSource : PullRequestTableViewDataSource<PullRequestTableViewCell,GitHubPullRequest>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
    }
    
    init(viewModel: GitPullRequestViewModel) {
        gitPullRequestViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        fetchPullRequestData()
    }
    
    
    /// Setup UI Elements for the View
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
    
    /// Fetch Pull request Data using viewModel
    private func fetchPullRequestData() {
        gitPullRequestViewModel?.fetchPullRequestList(onCompletion: { pullRequestData in
            self.updateDataSource()
        })
    }
    
    
    /// Configure TableViewCell and Update the tableview data source
    private func updateDataSource() {
        dataSource = PullRequestTableViewDataSource(cellIdentifier: "cell", items: gitPullRequestViewModel?.pullrequests ?? [], configureCell: { cell, pullRequestData in
            cell.viewModel = PullRequestsCellViewModel(data: pullRequestData)
        })
        
        DispatchQueue.main.async {
            self.pullRequestTableView.dataSource = self.dataSource
            self.pullRequestTableView.reloadData()
        }
    }

}

extension GitHubPullRequestsVC {
    
    /// Use Tableview willDisplay funcion for pagination/
    /// Fetching data when last item will display
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = (gitPullRequestViewModel?.pullrequests.count ?? 0) - 1
        if indexPath.row == lastItem {
            print(lastItem)
            fetchPullRequestData()
        }
    }
    
}
