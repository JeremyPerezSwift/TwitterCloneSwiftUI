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
                FeedView()
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
