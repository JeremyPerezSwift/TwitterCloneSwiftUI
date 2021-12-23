//
//  FeedViewModel.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 23/12/2021.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    
    init() {
        fetchTweets()
    }
    
    func fetchTweets() {
        COLLECTION_TWEETS.getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            self.tweets = documents.map({ Tweet(dictionnary: $0.data()) })
        }
    }
}
