//
//  FeedView.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 17/11/2021.
//

import SwiftUI

struct FeedView: View {
    @State var isShowingNewTweetView = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            
            ScrollView {
                LazyVStack {
                    VStack {
                        ForEach(0..<20) { _ in
                            TweetCell()
                                .padding(.bottom)
                        }
                    }.padding()
                }
            }
            
            Button(action: {
//                isShowingNewTweetView.toggle()
                viewModel.sighOut()
            }) {
                Image("quill-pen")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 25, height: 25)
                    .padding()
            }
            .background(Color(uiColor: .systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $isShowingNewTweetView, content: {
                NewTweetView(isPresented: $isShowingNewTweetView)
            })
        }
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
