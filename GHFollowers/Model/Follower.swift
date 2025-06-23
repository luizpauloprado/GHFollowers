//
//  Follower.swift
//  GHFollowers
//
//  Created by Luiz Paulo on 17/06/25.
//

import Foundation

struct Follower: Codable, Hashable {
    var login: String
    var avatarUrl: String
    
    // Custom hash sample
    // func hash(into hasher: inout Hasher) {
    //     hasher.combine(login)
    //  }
}
