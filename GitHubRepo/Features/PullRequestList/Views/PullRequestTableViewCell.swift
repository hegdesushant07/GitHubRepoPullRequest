//
//  PullRequestTableViewCell.swift
//  GitHubRepo
//
//  Created by Sushant Hegde on 09/02/23.
//

import Foundation
import UIKit
import Kingfisher

final class PullRequestTableViewCell: UITableViewCell {
    
    private var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
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
    
    var viewModel: PullRequestsCellViewModel? {
        didSet {
            bindData()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
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
    
    private func bindData() {
        guard let viewModel = viewModel else {
            return
        }
        
        KF.url(URL(string: viewModel.user.avatarURL)).set(to: userImageView)
        titleLabel.text = viewModel.title
        descriptLabel.text = "#\(viewModel.number) by \(viewModel.user.login) was closed on \(viewModel.closedDate)"
        
    }
    
}
