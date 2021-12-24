//
//  ChatViewModel.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 24/12/2021.
//

import SwiftUI
import Firebase

struct ChatViewModel {
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func fetchMessages() {
        
    }
    
    func sendMessage(_ messageText: String) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        let currentUserRef = COLLECTION_MESSAGES.document(currentUid).collection(user.id).document()
        let receivingUserRef = COLLECTION_MESSAGES.document(user.id).collection(currentUid)
        let receivingRecentRef = COLLECTION_MESSAGES.document(user.id).collection("recent-messages")
        let currentRecentRef = COLLECTION_MESSAGES.document(currentUid).collection("recent-messages")
        
        let messageID = currentUserRef.documentID
        
        let data: [String: Any] = ["text": messageText, "id": messageID, "fromId": currentUid, "toId": user.id, "timestamp": Timestamp(date: Date())]
        
        currentUserRef.setData(data) { error in
            receivingUserRef.document(messageID).setData(data) { error2 in
                receivingRecentRef.document(currentUid).setData(data) { error3 in
                    currentRecentRef.document(user.id).setData(data) { error4 in
                        
                    }
                }
            }
        }
    }
}
