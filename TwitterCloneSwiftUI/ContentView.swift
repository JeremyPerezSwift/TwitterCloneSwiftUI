//
//  ContentView.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 16/11/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            TabView {
                Text("Feed")
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                
                Text("Search")
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                
                Text("Messages")
                    .tabItem {
                        Image(systemName: "envelope")
                        Text("Messages")
                    }
            }
            
//            Text("Home")
//                .navigationBarTitleDisplayMode(.inline)
//                .toolbar {
//                    ToolbarItem(placement: .principal) {
//                        HStack {
//                            Text("Home").font(.headline)
//                        }
//                    }
//                }
            
            .navigationBarTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
