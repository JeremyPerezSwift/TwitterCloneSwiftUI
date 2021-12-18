//
//  ContentView.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 16/11/2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            
            if viewModel.userSession != nil {
                
                TabView {
                    
                    NavigationView {
                        FeedView()
                            .navigationTitle("Home")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }

                    NavigationView {
                        SearchView()
                            .navigationTitle("Search")
                            .navigationBarTitleDisplayMode(.inline)
                    }
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }

                    NavigationView {
                        ConversationView()
                            .navigationTitle("Messages")
                            .navigationBarTitleDisplayMode(.inline)
                            .onAppear {
                                UITabBar.appearance().isHidden = true
                            }
                    }
                    .tabItem {
                        Image(systemName: "envelope")
                        Text("SearMessagesch")
                    }
                }
                
            } else {
                LoginView()
            }
            
        }
        
//        NavigationView {
//            TabView {
//                FeedView()
//                    .tabItem {
//                        Image(systemName: "house")
//                        Text("Home")
//                    }
//
//                SearchView()
//                    .tabItem {
//                        Image(systemName: "magnifyingglass")
//                        Text("Search")
//                    }
//
//                ConversationView()
//                    .tabItem {
//                        Image(systemName: "envelope")
//                        Text("Messages")
//                    }
//            }
//
//            .navigationBarTitle("Home")
//            .navigationBarTitleDisplayMode(.inline)
//
//        }
        
//        NavigationView {
//
//        }
        
//        NavigationView {
//            TabView {
//                FeedView()
//                    .navigationTitle("Home")
//                    .navigationBarTitleDisplayMode(.inline)
//                    .tabItem {
//                        Image(systemName: "house")
//                        Text("Home")
//                    }
//
//                SearchView()
//                    .navigationTitle("Search")
//                    .navigationBarTitleDisplayMode(.inline)
//                    .tabItem {
//                        Image(systemName: "magnifyingglass")
//                        Text("Search")
//                    }
//
//                ConversationView()
//                    .navigationTitle("Messages")
//                    .navigationBarTitleDisplayMode(.inline)
//                    .tabItem {
//                        Image(systemName: "envelope")
//                        Text("SearMessagesch")
//                    }
//            }
//        }
//        .navigationTitle("Messages")
//        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
