//
//  TweetActionViewModel.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 23/12/2021.
//

import SwiftUI

class TweetActionViewModel: ObservableObject {
    let tweet: Tweet
    @Published var didLike = false
    
    init(tweet: Tweet) {
        self.tweet = tweet
    }
    
    func likeTweet() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        
        COLLECTION_TWEETS.document(tweet.id).updateData(["likes": tweet.likes + 1]) { error in
            COLLECTION_TWEETS.document(self.tweet.id).collection("tweet-likes").document(uid).setData([:]) { error2 in
                COLLECTION_USERS.document(uid).collection("user-likes").document(self.tweet.id).setData([:]) { error3 in
                    self.didLike = true
                }
            }
        }
    }
    
    func unlikeTweet() {
        
    }
    
}
