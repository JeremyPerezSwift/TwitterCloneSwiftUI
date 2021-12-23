//
//  ProfileViewModel.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 04/12/2021.
//

import SwiftUI
import Firebase
import FirebaseFirestore

class ProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var isFollowed = false
    
    init(user: User) {
        self.user = user
    }
    
    func follow() {
        guard let currenUid = Auth.auth().currentUser?.uid else { return }
        
        COLLECTION_FOLLOWING.document(currenUid).collection("user-following").document(user.id).setData([:]) { error in
            COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers").document(currenUid).setData([:]) { error2 in
                self.isFollowed = true
            }
        }
    }
    
    func unfollow() {
        guard let currenUid = Auth.auth().currentUser?.uid else { return }
        
        COLLECTION_FOLLOWING.document(currenUid).collection("user-following").document(user.id).delete { error in
            COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers").document(currenUid).delete { error2 in
                self.isFollowed = false
            }
        }
    }
}
