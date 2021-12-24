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
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
//            NavigationLink(isActive: $showChat) {
//                ChatView(user: )
//                    .onAppear(perform: {
//                        UITabBar.appearance().barTintColor = .white
//                        UITabBar.
//                    })
//            } label: {
//
//            }

            
            ScrollView {
                LazyVStack {
                    VStack {
                        ForEach(0..<20) { _ in
                            ConversationCell()
//                            NavigationLink(destination: ChatView(user: )) {
//                                ConversationCell()
//                                    .padding(.top, 5)
//                            }
//                            ConversationCell()
//                                .padding(.top, 5)
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
                NewMessageView(show: $isShowingNewMessageView, startChat: $showChat)
            })
        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
