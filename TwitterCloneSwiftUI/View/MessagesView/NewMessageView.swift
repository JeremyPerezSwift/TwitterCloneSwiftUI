//
//  NewMessageView.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 25/11/2021.
//

import SwiftUI

struct NewMessageView: View {
    @State var searchText = ""
    @Binding var show: Bool
    @Binding var startChat: Bool
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            VStack(alignment: .leading) {
                ForEach(0..<3) { _ in
                    HStack { Spacer() }
                    Button(action: {
                        self.show.toggle()
                        self.startChat.toggle()
                    }) {
                        UserCell()
                    }
                    
            
                }
            }
            .padding(.leading)
        }
        .navigationTitle("Search")
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView(show: .constant(true), startChat: .constant(true))
    }
}
