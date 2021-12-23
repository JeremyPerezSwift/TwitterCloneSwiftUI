//
//  ContentView.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 16/11/2021.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            
            if viewModel.userSession != nil {
                
                TabView {
                    
                    NavigationView {
                        FeedView()
                            .navigationTitle("Home")
                            .navigationBarItems(leading: Button(action: {
                                viewModel.sighOut()
                            }, label: {
                                if let user = viewModel.user {
                                    KFImage(URL(string: user.profileImageUrl))
                                        .resizable()
                                        .scaledToFill()
                                        .clipped()
                                        .frame(width: 32, height: 32)
                                        .cornerRadius(16)
                                }
                            }))
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
                        Text("Messages")
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
