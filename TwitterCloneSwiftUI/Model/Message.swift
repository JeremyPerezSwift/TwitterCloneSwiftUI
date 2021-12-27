//
//  MockMessage.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 25/11/2021.
//

import Firebase
import SwiftUI

struct Message: Identifiable {
    let text: String
    let user: User
    let toId: String
    let fromId: String
    let isFromCurrentUser: Bool
    let timestamp: Timestamp
    let id: String
    
    var chatPartnerId: String { return isFromCurrentUser ? toId : fromId }
    
    init(user: User, dictionnary: [String: Any]) {
        self.user = user
        
        self.text = dictionnary["text"] as? String ?? ""
        self.toId = dictionnary["toId"] as? String ?? ""
        self.fromId = dictionnary["fromId"] as? String ?? ""
        self.isFromCurrentUser = fromId == Auth.auth().currentUser?.uid
        self.timestamp = dictionnary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        self.id = dictionnary["id"] as? String ?? ""
    }
}

struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}

let MOCK_MESSAGES: [MockMessage] = [
    .init(id: 0, imageName: "joker", messageText: "Hey what's up?", isCurrentUser: false),
    .init(id: 1, imageName: "spidey", messageText: "No much, you?", isCurrentUser: true),
    .init(id: 2, imageName: "spidey", messageText: "How the marvel universe?", isCurrentUser: true),
    .init(id: 3, imageName: "joker", messageText: "Nope ! DC comics.", isCurrentUser: false),
    .init(id: 4, imageName: "joker", messageText: "How's your battle with the mysterio ?", isCurrentUser: false),
    .init(id: 5, imageName: "spidey", messageText: "Not going so hot...", isCurrentUser: true)
    
    
]
