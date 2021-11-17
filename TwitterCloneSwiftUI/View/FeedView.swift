//
//  FeedView.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 17/11/2021.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            ScrollView {
                
            }
            
            Button(action: {}) {
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
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
