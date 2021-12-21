//
//  SearchView.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 19/11/2021.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            VStack(alignment: .leading) {
                ForEach(viewModel.users, id: \.username) { user in
                    HStack { Spacer() }
                    
                    NavigationLink(destination: UserProfileView(user: user)) {
                        UserCell(user: user)
                            .padding(.top, 5)
                    }
            
                }
            }
            .padding(.leading)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
