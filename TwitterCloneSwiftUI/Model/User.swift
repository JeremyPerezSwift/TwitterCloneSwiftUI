//
//  User.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 04/12/2021.
//

import Firebase

struct User: Identifiable {
    
    let id: String
    let username: String
    let profileImageUrl: String
    let fullname: String
    let email: String
    var stats: UserStats
    var bio: String
    
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == self.id }
    var isFollowed = false
    
    init(dictionnary: [String: Any]) {
        self.id = dictionnary["uid"] as? String ?? ""
        self.username = dictionnary["username"] as? String ?? ""
        self.profileImageUrl = dictionnary["profileImageUrl"] as? String ?? ""
        self.fullname = dictionnary["fullname"] as? String ?? ""
        self.email = dictionnary["email"] as? String ?? ""
        self.stats = UserStats(followers: 0, following: 0)
        self.bio = dictionnary["bio"] as? String ?? ""
//        self.isCurrentUser = Auth.auth().currentUser?.uid == self.id
    }
    
}

struct UserStats {
    var followers: Int
    var following: Int
}
