//
//  TweetActionView.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 23/12/2021.
//

import SwiftUI

struct TweetActionView: View {
    let tweet: Tweet
    @ObservedObject var viewModel: TweetActionViewModel
    
    init(tweet: Tweet) {
        self.tweet = tweet
        self.viewModel = TweetActionViewModel(tweet: tweet)
    }
    
    var body: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "bubble.left")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            }
            
            Spacer()
            
            Button(action: {}) {
                Image(systemName: "arrow.2.squarepath")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            }
            
            Spacer()
            
            Button(action: {
                viewModel.didLike ? viewModel.unlikeTweet() : viewModel.likeTweet()
            }) {
                Image(systemName: viewModel.didLike ? "heart.fill" : "heart")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
                    .foregroundColor(viewModel.didLike ? .red : .gray)
            }
            
            Spacer()
            
            Button(action: {}) {
                Image(systemName: "bookmark")
                    .font(.system(size: 16))
                    .frame(width: 32, height: 32)
            }
        }
        .foregroundColor(.gray)
        .padding(.horizontal)
    }
}

//struct TweetActionView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetActionView()
//    }
//}
