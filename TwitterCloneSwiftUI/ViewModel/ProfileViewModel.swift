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
//    @Published var isFollowed = false
    @Published var userTweets = [Tweet]()
    @Published var likedTweets = [Tweet]()
    
    init(user: User) {
        self.user = user
        checkIfUserIsFollowed()
        fetchUserTweets()
        fetchLikedTweets()
        fetchUserStats()
    }
    
    func tweets(forFilter filter: TweetFileterOptions) -> [Tweet] {
        switch filter {
            
        case .tweets:
            return userTweets
        case .replies:
            return [Tweet]()
        case .likes:
            return likedTweets
        }
    }
   
}

// MARK: - API

extension ProfileViewModel {
    func follow() {
        guard let currenUid = Auth.auth().currentUser?.uid else { return }
        
        COLLECTION_FOLLOWING.document(currenUid).collection("user-following").document(user.id).setData([:]) { error in
            COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers").document(currenUid).setData([:]) { error2 in
                self.user.isFollowed = true
            }
        }
    }
    
    func unfollow() {
        guard let currenUid = Auth.auth().currentUser?.uid else { return }
        
        COLLECTION_FOLLOWING.document(currenUid).collection("user-following").document(user.id).delete { error in
            COLLECTION_FOLLOWERS.document(self.user.id).collection("user-followers").document(currenUid).delete { error2 in
                self.user.isFollowed = false
            }
        }
    }
    
    func checkIfUserIsFollowed() {
        guard let currenUid = Auth.auth().currentUser?.uid else { return }
        guard !user.isCurrentUser else { return }
        
        COLLECTION_FOLLOWING.document(currenUid).collection("user-following").document(user.id).getDocument { snapshot, error in
            guard let isFollowed = snapshot?.exists else { return }
            self.user.isFollowed = isFollowed
        }
    }
    
    func fetchUserTweets() {
        COLLECTION_TWEETS.whereField("uid", isEqualTo: user.id).getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            self.userTweets = documents.map({ Tweet(dictionnary: $0.data()) })
        }
    }
    
    func fetchLikedTweets() {
        var tweets = [Tweet]()
        COLLECTION_USERS.document(user.id).collection("user-likes").getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            let tweetIDs = documents.map({ $0.documentID })
            
            tweetIDs.forEach { id in
                COLLECTION_TWEETS.document(id).getDocument { snapshot2, error2 in
                    guard let data = snapshot2?.data() else { return }
                    let tweet = Tweet(dictionnary: data)
                    tweets.append(tweet)
                    print("DEBUG: fetchLikedTweets \(tweet)")
                    
                    if tweets.count == tweetIDs.count {
                        self.likedTweets = tweets
                    }
                }
            }
        }
    }
    
    func fetchUserStats() {
        let followersRef = COLLECTION_FOLLOWERS.document(user.id).collection("user-followers")
        let followingRef = COLLECTION_FOLLOWING.document(user.id).collection("user-following")
        
        followersRef.getDocuments { snapshot, error in
            guard let followerCount = snapshot?.documents.count else { return }
            
            followingRef.getDocuments { snapshot2, error2 in
                guard let followingCount = snapshot2?.documents.count else { return }
                
                let stats = UserStats(followers: followerCount, following: followingCount)
                self.user.stats = stats
            }
        }
    }
    
}
