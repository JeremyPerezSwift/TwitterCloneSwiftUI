//
//  MessageView.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 25/11/2021.
//

import SwiftUI
import Kingfisher

struct MessageView: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.isFromCurrentUser {
                Spacer()
                Text(message.text)
                    .padding()
                    .font(.system(size: 13))
                    .background(Color.blue)
                    .clipShape(ChatBubble(isFromCurrentUser: true))
                    .foregroundColor(.white)
                    .padding(.leading, 100)
                    .padding(.trailing, 16)
            } else {
                HStack(alignment: .bottom) {
                    
                    KFImage(URL(string: message.user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text(message.text)
                        .padding()
                        .font(.system(size: 13))
                        .background(Color(uiColor: .systemGray5))
                        .clipShape(ChatBubble(isFromCurrentUser: false))
                        .foregroundColor(.black
                        )
                    
                }
                .padding(.horizontal)
                .padding(.trailing, 100)
                .padding(.leading, 16)
                Spacer()
            }
            
        }
    }
}

//struct MessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageView(message: MOCK_MESSAGES[0])
//    }
//}
