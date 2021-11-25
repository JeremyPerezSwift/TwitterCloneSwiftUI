//
//  ChatView.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 23/11/2021.
//

import SwiftUI

struct ChatView: View {
    @State var messageText: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(MOCK_MESSAGES) { message in
                        HStack {
                            if message.isCurrentUser {
                                Spacer()
                                Text(message.messageText)
                                    .padding()
                                    .font(.system(size: 13))
                                    .background(Color.blue)
                                    .clipShape(ChatBubble(isFromCurrentUser: true))
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                            } else {
                                HStack(alignment: .bottom) {
                                    
                                    Image(message.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(Circle())
                                    
                                    Text(message.messageText)
                                        .padding()
                                        .font(.system(size: 13))
                                        .background(Color(uiColor: .systemGray5))
                                        .clipShape(ChatBubble(isFromCurrentUser: false))
                                        .foregroundColor(.black
                                        )
                
                                }.padding(.horizontal, 8)
                                
                                Spacer()
                            }
                        
                        }
                    }
                }
            }
            
            MessageInputView(messageText: $messageText)
                .padding()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
