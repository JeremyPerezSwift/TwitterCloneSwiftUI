//
//  ConversationView.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 23/11/2021.
//

import SwiftUI

struct ConversationView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            ScrollView {
                LazyVStack {
                    VStack {
                        ForEach(0..<20) { _ in
                            ConversationCell()
                                .padding(.top, 5)
                        }
                    }.padding()
                }
            }
            
            Button(action: {}) {
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
        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
