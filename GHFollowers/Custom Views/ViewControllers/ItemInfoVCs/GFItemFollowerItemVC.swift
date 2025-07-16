//
//  GFItemFollowerItemVC.swift
//  GHFollowers
//
//  Created by Luiz Paulo on 15/07/25.
//

import UIKit

class GFFollowerItemVC: GFItemInfoVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoTpe: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoTpe: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}
