//
//  UploadTweetViewModel.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 23/12/2021.
//

import SwiftUI
import Firebase

class UploadTweetViewModel: ObservableObject {
    @Binding var isPresented: Bool
    
    init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    func uploadTweet(caption: String) {
        guard let user = AuthViewModel.shared.user else { return }
        let docRef = COLLECTION_TWEETS.document()
        
        let data: [String: Any] = ["uid": user.id, "caption": caption, "fullname": user.fullname, "username": user.username, "timestamp": Timestamp(date: Date()), "profileImageURL": user.profileImageUrl, "likes": 0, "id": docRef.documentID]
        
        docRef.setData(data) { error in
            print("DEBUG: Successfully uploaded tweet...")
            self.isPresented = false
        }
    }
    
}
