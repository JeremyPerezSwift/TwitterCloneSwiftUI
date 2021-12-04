//
//  User.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 04/12/2021.
//

import Foundation

struct User: Identifiable {
    
    let id: String
    let username: String
    let profileImageUrl: String
    let fullname: String
    let email: String
    var stats: UserStats
    var bio: String
    
    var isFollowed = false
    
    init(dictionnary: [String: Any]) {
        self.id = dictionnary["id"] as? String ?? ""
        self.username = dictionnary["username"] as? String ?? ""
        self.profileImageUrl = dictionnary["profileImageUrl"] as? String ?? ""
        self.fullname = dictionnary["fullname"] as? String ?? ""
        self.email = dictionnary["email"] as? String ?? ""
        self.stats = UserStats(followers: 0, following: 0)
        self.bio = dictionnary["bio"] as? String ?? ""
    }
    
}

struct UserStats {
    var followers: Int
    var following: Int
}
