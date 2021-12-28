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
    @State private var selectedIndex = 0
    
    @State var showMenu: Bool = false
    @State var animatedPath: Bool = false
    @State var animateBg: Bool = false
    
    var body: some View {
        Group {
            
            if viewModel.userSession != nil {
                
                NavigationView {
                    ZStack {
                        
                        MainTabView(selectedIndex: $selectedIndex)
                            .cornerRadius(10)
                            .ignoresSafeArea()
                            .navigationBarTitle(viewModel.tabTitle(forIndex: showMenu ? 3 : selectedIndex))
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarItems(leading: Button(action: {
                                
                            }, label: {
                                if let user = viewModel.user {
                                    if showMenu == false {
                                        Button {
                                            withAnimation {
                                                animateBg.toggle()
                                            }
                                            
                                            withAnimation(.spring()) {
                                                showMenu.toggle()
                                            }
                                            
                                            withAnimation(.interactiveSpring(response: 0.4, dampingFraction: 0.3, blendDuration: 0.3).delay(0.2)) {
                                                animatedPath.toggle()
                                            }
                                        } label: {
                                            KFImage(URL(string: user.profileImageUrl))
                                                .resizable()
                                                .scaledToFill()
                                                .clipped()
                                                .frame(width: 32, height: 32)
                                                .cornerRadius(16)
                                        }
                                        
                                    } else {
                                        Button {
                                            withAnimation(.interactiveSpring(response: 0.4, dampingFraction: 0.3, blendDuration: 0.3)) {
                                                animatedPath.toggle()
                                            }
                                            
                                            withAnimation {
                                                animateBg.toggle()
                                            }

                                            withAnimation(.spring().delay(0.1)) {
                                                showMenu.toggle()
                                            }
                                        } label: {
                                            Image(systemName: "xmark.circle")
                                                .font(.title)
                                        }
                                        .foregroundColor(Color("color-twitter"))
                                    }
                                    
                                }
                            }))
                        
//                        Color.white
//                            .opacity(animateBg ? 0.25 : 0)
//                            .ignoresSafeArea()
                        
                        MenuView(showMenu: $showMenu, animatedPath: $animatedPath, animatedBG: $animateBg)
                            .offset(x: showMenu ? 0 : -getRect().width)
                        
                    }
                }
                
                
            } else {
                LoginView()
            }
            
        }
    }
}
