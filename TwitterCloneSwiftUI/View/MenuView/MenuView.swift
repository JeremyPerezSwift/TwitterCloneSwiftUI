//
//  MenuView.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 28/12/2021.
//

import SwiftUI

struct MenuView: View {
    @Binding var showMenu: Bool
    @Binding var animatedPath: Bool
    @Binding var animatedBG: Bool
    
    var body: some View {
        
        ZStack {
            BlurView(style: .systemUltraThinMaterialLight)
            
            Color(UIColor.white)
                .opacity(0.3)
                .blur(radius: 15)
            
            VStack(alignment: .leading, spacing: 25) {
                
                MenuButton(title: "Profile", image: "square.grid.2x2", offSet: 10)
                MenuButton(title: "Help", image: "questionmark.circle", offSet: 10)
                MenuButton(title: "Logout", image: "rectangle.portrait.and.arrow.right", offSet: 10)
                
            }
            .padding(.trailing, 120)
            .padding()
            .padding(.top, 100)
            .padding(.bottom, getSafeArea().bottom)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .clipShape(MenuShape(value: animatedPath ? 150 : 0))
        .background(
            MenuShape(value: animatedPath ? 150 : 0)
                .stroke(
                    .linearGradient(.init(colors: [
                        Color("color-twitter"),
                        Color("color-twitter")
                            .opacity(0.7),
                        Color("color-twitter")
                            .opacity(0.5),
                        Color.clear
                    ]), startPoint: .top, endPoint: .bottom), lineWidth: animatedPath ? 7 : 0
                )
                .padding(.leading, -50)
        )
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    func MenuButton(title: String, image: String, offSet: CGFloat) -> some View {
        Button {
            
        } label: {
            HStack(spacing: 12) {
                if image == "Profile" {
                    Image(systemName: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                } else {
                    Image(systemName: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 25, height: 25)
                        .foregroundColor(Color("color-twitter"))
                    
                    Text(title)
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .foregroundColor(Color.black.opacity(1))
                }
            }
            .padding(.vertical)
        }
        .offset(x: offSet)

    }
    
}
