//
//  ConversationViewModel.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 24/12/2021.
//

import SwiftUI

class ConversationViewModel: ObservableObject {
    @Published var recentMessages = [Message]()
    private var recentMessagesDictionnary = [String: Message]()
    
    init() {
        fetchRecentMessages()
    }
    
    func fetchRecentMessages() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        let query = COLLECTION_MESSAGES.document(uid).collection("recent-messages")
        query.order(by: "timestamp", descending: true)
        
        query.addSnapshotListener { snapshot, error in
            guard let changes = snapshot?.documentChanges else { return }
            
            changes.forEach { change in
                let messageData = change.document.data()
                let uid = change.document.documentID
                
                COLLECTION_USERS.document(uid).getDocument { snapshot2, error2 in
                    guard let data = snapshot2?.data() else { return }
                    let user = User(dictionnary: data)
                    self.recentMessagesDictionnary[uid] = Message(user: user, dictionnary: messageData)
                    
                    self.recentMessages = Array(self.recentMessagesDictionnary.values)
                    
//                    self.recentMessages.append(Message(user: user, dictionnary: messageData))
                }
            }
        }
    }
}
