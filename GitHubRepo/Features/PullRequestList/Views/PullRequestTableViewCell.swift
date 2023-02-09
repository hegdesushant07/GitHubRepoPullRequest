//
//  PullRequestTableViewCell.swift
//  GitHubRepo
//
//  Created by Sushant Hegde on 09/02/23.
//

import Foundation
import UIKit

final class PullRequestTableViewCell: UITableViewCell {
    
    private var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        return label
    }()
        
    private var descriptLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        setupViewElements()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewElements() {
        contentView.addSubview(userImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptLabel)
        
        NSLayoutConstraint.activate([
            userImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            userImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 8),
            userImageView.heightAnchor.constraint(equalToConstant: 40),
            userImageView.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 8),
        ])

        NSLayoutConstraint.activate([
            descriptLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0),
            descriptLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptLabel.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            descriptLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
        
    }
    
    func updateData(data: GitHubPullRequest) {
        titleLabel.text = data.title
        if let closedAt = data.closedAt {
            descriptLabel.text = "#\(data.number) by \(data.user.login) was closed by \(closedAt) "
        }
    }
    
}
