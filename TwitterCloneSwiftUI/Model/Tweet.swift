//
//  Tweet.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 23/12/2021.
//

import Firebase

struct Tweet: Identifiable {
    
    let id: String
    let username: String
    let profileImageUrl: String
    let fullname: String
    let caption: String
    let likes: Int
    let uid: String
    let timestamp: Timestamp
    
    init(dictionnary: [String: Any]) {
        self.id = dictionnary["id"] as? String ?? ""
        self.username = dictionnary["username"] as? String ?? ""
        self.profileImageUrl = dictionnary["profileImageURL"] as? String ?? ""
        self.fullname = dictionnary["fullname"] as? String ?? ""
        self.caption = dictionnary["caption"] as? String ?? ""
        self.likes = dictionnary["likes"] as? Int ?? 0
        self.uid = dictionnary["uid"] as? String ?? ""
        self.timestamp = dictionnary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
    }
    
    var timestampString: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: timestamp.dateValue(), to: Date()) ?? ""
    }
    
    var detailedTimestampString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a - MM/dd/yyyy"
        return formatter.string(from: timestamp.dateValue())
    }
    
}
