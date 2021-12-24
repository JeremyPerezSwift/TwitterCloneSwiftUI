//
//  UserProfileView.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 29/11/2021.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    @ObservedObject var viewModel: ProfileViewModel
    @State var selectedFilter: TweetFileterOptions = .tweets
    
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                VStack {
                    ProfileHeaderView(viewModel: viewModel)
                        .padding()
                    
                    FilterButtonView(selectedOption: $selectedFilter)
                        .padding()
                    
                    ForEach(viewModel.tweets(forFilter: selectedFilter)) { tweet in
                        TweetCell(tweet: tweet)
                            .padding(.bottom)
                    }
                }
                .padding()
                .navigationTitle(user.username)
            }
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(user: User(dictionnary: ["":""]))
    }
}
