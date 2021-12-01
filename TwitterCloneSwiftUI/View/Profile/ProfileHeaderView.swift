//
//  ProfileHeaderView.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 29/11/2021.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack {
            Image("spidey")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 120, height: 120)
                .cornerRadius(120 / 2)
                .shadow(color: .black, radius: 6, x: 0.0, y: 0.0)
            
            Text("Peter Parker")
                .font(.system(size: 16, weight: .semibold))
                .padding(.top, 8)
            
            Text("@Spiderman")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Scientific by day, spider by night")
                .font(.system(size: 14))
                .padding(.top, 8)
            
            HStack(spacing: 32) {
                VStack {
                    Text("12")
                        .font(.system(size: 16)).bold()
                    
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
                VStack {
                    Text("12")
                        .font(.system(size: 16)).bold()
                    
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            
            ProfileActionButtonView(isCurrentUser: false)
            
            Spacer()
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
