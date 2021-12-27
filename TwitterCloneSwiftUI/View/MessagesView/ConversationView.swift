//
//  ConversationView.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 23/11/2021.
//

import SwiftUI

struct ConversationView: View {
    @State var isShowingNewMessageView = false
    @State var showChat = false
    @ObservedObject var viewModel = ConversationViewModel()
    @State var user: User?
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            if let use = user {
                NavigationLink(isActive: $showChat) {
                    ChatView(user: use)
                } label: {

                }
            }

            
            ScrollView {
                LazyVStack {
                    VStack {
                        ForEach(viewModel.recentMessages) { recentMessage in
                            NavigationLink(destination: LazyView(ChatView(user: recentMessage.user))) {
                                ConversationCell(message: recentMessage)
                                    .padding(.top, 5)
                            }
                        }
                    }.padding()
                }
            }
            
            Button(action: { self.isShowingNewMessageView.toggle() }) {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .padding()
            }
            .background(Color(uiColor: .systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .sheet(isPresented: $isShowingNewMessageView, content: {
                NewMessageView(show: $isShowingNewMessageView, startChat: $showChat, user: $user)
            })
        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
