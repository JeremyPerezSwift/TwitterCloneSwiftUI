//
//  LoginView.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 08/12/2021.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Image("twitter")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .padding(.top, 100)
                        .padding(.bottom, 20)
                    
                    VStack(spacing: 20) {
                        CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                        
                        CustomSecureField(text: $password, placeholder: Text("Password"), imageName: "lock")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {}) {
                            Text("Forgot Password ?")
                                .font(.footnote)
                                .bold()
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    
                    Button(action: {}) {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(Color("color-twitter"))
                            .frame(width: 350, height: 50)
                            .background(Color.white)
                            .clipShape(Capsule())
                    }
                    
                    
                    Spacer()
                    
                    NavigationLink(destination: RegistrationView().navigationBarBackButtonHidden(true)) {
                        HStack {
                            Text("Don't have an account ?")
                                .font(.system(size: 14))
                            
                            Text("Sign Up")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .foregroundColor(.white)
                        .padding(.bottom, 40)
                    }
                    
//                    HStack {
//                        Button(action: {}) {
//                            Text("Don't have an account ?")
//                                .font(.system(size: 14))
//
//                            Text("Sign Up")
//                                .font(.system(size: 14, weight: .semibold))
//                        }
//                    }
//                    .foregroundColor(.white)
//                    .padding(.bottom, 40)
                        
                }
            }
            .background(Color("color-twitter"))
        .ignoresSafeArea()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
