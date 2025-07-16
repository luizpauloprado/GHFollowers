//
//  GFRepoItemVC.swift
//  GHFollowers
//
//  Created by Luiz Paulo on 15/07/25.
//

import UIKit

class GFRepoItemVC: GFItemInfoVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoTpe: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoTpe: .gist, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }
}
