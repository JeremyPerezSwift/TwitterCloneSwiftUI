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
                            .foregroundColor(.black)
                            .font(.system(size: 13, weight: .semibold))
                        
                        Text("@\(tweet.username) -")
                            .foregroundColor(.gray)
                            .font(.system(size: 13))
                        
                        Text(tweet.timestampString)
                            .foregroundColor(.gray)
                            .font(.system(size: 13))
                    }
                    
                    Text(tweet.caption)
                        .foregroundColor(.black)
                        .font(.system(size: 15))
                
                }
            }
            
            TweetActionView(tweet: tweet)
            
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
