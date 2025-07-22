//
//  FollowerCell.swift
//  GHFollowers
//
//  Created by Luiz Paulo on 20/06/25.
//

import UIKit
import SwiftUI

class FollowerCell: UICollectionViewCell {
    static let reusedID = "FollowerCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(follower: Follower) {
        contentConfiguration = UIHostingConfiguration { FollowerView(follower: follower) }
    }
}
