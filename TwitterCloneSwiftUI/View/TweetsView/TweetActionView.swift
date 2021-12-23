//
//  TweetActionView.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 23/12/2021.
//

import SwiftUI

struct TweetActionView: View {
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
    }
}

struct TweetActionView_Previews: PreviewProvider {
    static var previews: some View {
        TweetActionView()
    }
}
