//
//  FavoriteCell.swift
//  GHFollowers
//
//  Created by Luiz Paulo on 16/07/25.
//

import UIKit

class FavoriteCell: UITableViewCell {
    static let reusedID = "FavoriteCell"
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignemnt: .left, fontSize: 26)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(favorite: Follower) {
        usernameLabel.text = favorite.login
        avatarImageView.setImage(from: favorite.avatarUrl)
    }
    
    private func configure() {
        addSubviews(avatarImageView, usernameLabel)

        accessoryType = .disclosureIndicator
        
        let padding: CGFloat = 12
        
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            avatarImageView.heightAnchor.constraint(equalToConstant: 60),
            avatarImageView.widthAnchor.constraint(equalToConstant: 60),
            
            usernameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 24),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 24),
            usernameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
