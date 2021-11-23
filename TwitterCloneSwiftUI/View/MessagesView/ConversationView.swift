//
//  ConversationView.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 23/11/2021.
//

import SwiftUI

struct ConversationView: View {
    @State var isShowingNewMessageView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            ScrollView {
                LazyVStack {
                    VStack {
                        ForEach(0..<20) { _ in
                            NavigationLink(destination: ChatView()) {
                                ConversationCell()
                                    .padding(.top, 5)
                            }
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
            .sheet(isPresented: $isShowingNewMessageView) {
                SearchView()
            }
        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
