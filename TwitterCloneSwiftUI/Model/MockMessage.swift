//
//  MockMessage.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 25/11/2021.
//

import Foundation

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
