//
//  SearchView.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 19/11/2021.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText)
                .padding()
            
            VStack {
                ForEach(0..<20) { _ in
                    Text("Add Users here ...")
                }
            }
        }
        .navigationTitle("Search")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
