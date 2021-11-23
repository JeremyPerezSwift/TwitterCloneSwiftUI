//
//  ConversationCell.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 23/11/2021.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                Image("joker")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(28)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Joker")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("Lounger messages text to see what happens i does this")
                        .font(.system(size: 14))
                        .lineLimit(2)
                }
            }
            
            Divider()
        }
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
