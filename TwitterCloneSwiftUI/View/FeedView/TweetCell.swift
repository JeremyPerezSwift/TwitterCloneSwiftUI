//
//  TweetCell.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 18/11/2021.
//

import SwiftUI
import Kingfisher

struct TweetCell: View {
    let tweet: Tweet
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                KFImage(URL(string: tweet.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 46, height: 46)
                    .cornerRadius(46 / 2)
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text(tweet.fullname)
                            .font(.system(size: 13, weight: .semibold))
                        
                        Text("@\(tweet.username) -")
                            .foregroundColor(.gray)
                            .font(.system(size: 13))
                        
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.system(size: 13))
                    }
                    
                    Text(tweet.caption)
                        .font(.system(size: 15))
                
                }
            }
            
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
                
                Button(action: {}) {
                    Image(systemName: "heart")
                        .font(.system(size: 16))
                        .frame(width: 32, height: 32)
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
            
            Divider()
            
        }
        .padding(.leading, -16)
    }
}

//struct TweetCell_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetCell()
//    }
//}
