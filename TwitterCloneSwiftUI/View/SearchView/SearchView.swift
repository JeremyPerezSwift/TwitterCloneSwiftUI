//
//  SearchView.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 19/11/2021.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @ObservedObject var viewModel = SearchViewModel(config: .search)
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            VStack(alignment: .leading) {
                ForEach(searchText.isEmpty ? viewModel.users : viewModel.filterdUsers(searchText), id: \.id) { user in
                    HStack { Spacer() }
                    
                    NavigationLink(destination: LazyView(UserProfileView(user: user))) {
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
