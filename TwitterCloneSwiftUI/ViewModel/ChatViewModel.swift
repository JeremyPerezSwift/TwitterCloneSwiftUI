//
//  ChatViewModel.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 24/12/2021.
//

import SwiftUI
import Firebase

class ChatViewModel: ObservableObject {
    let user: User
    @Published var messages = [Message]()
    
    init(user: User) {
        self.user = user
        fetchMessages()
    }
    
    func fetchMessages() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        let query = COLLECTION_MESSAGES.document(uid).collection(user.id)
//        query.order(by: "timestamp", descending: false)
        
        query.addSnapshotListener { snapshot, error in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            
            changes.forEach { change in
                let messageData = change.document.data()
                guard let fromId = messageData["fromId"] as? String else { return }
                
                COLLECTION_USERS.document(fromId).getDocument { snapshot2, error2 in
                    guard let data = snapshot2?.data() else { return }
                    let user = User(dictionnary: data)
                    
                    self.messages.append(Message(user: user, dictionnary: messageData))
                    self.messages.sort(by: { $0.timestamp.dateValue() < $1.timestamp.dateValue() })
                }
            }
        }
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
                    currentRecentRef.document(self.user.id).setData(data) { error4 in
                        
                    }
                }
            }
        }
    }
}
