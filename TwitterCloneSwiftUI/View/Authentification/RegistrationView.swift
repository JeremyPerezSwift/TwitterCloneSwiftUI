//
//  RegistrationView.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 08/12/2021.
//

import SwiftUI

struct RegistrationView: View {
    @State var fullname = ""
    @State var email = ""
    @State var username = ""
    @State var password = ""
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @EnvironmentObject var viewModel: AuthViewModel
    
    func loadImage() {
        guard let selectedImg = selectedUIImage else { return }
        image = Image(uiImage: selectedImg)
    }
    
    var body: some View {
        ZStack {
            VStack {
                Button(action: { showImagePicker.toggle() }) {
                    ZStack {
                        if let img = image {
                            img
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipped()
                                .cornerRadius(70)
                                .padding(.top, 100)
                                .padding(.bottom, 20)
                        } else {
                            Image("plus")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .padding(.top, 100)
                                .padding(.bottom, 20)
                                .foregroundColor(.white)
                        }
                    }
                }
                .sheet(isPresented: $showImagePicker, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedUIImage)
                })
                
                VStack(spacing: 20) {
                    CustomTextField(text: $fullname, placeholder: Text("Full Name"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person")
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
                
                Button(action: {
                    guard let image = selectedUIImage else { return }
                    
                    viewModel.registerUser(email: email, password: password, username: username, fullname: fullname, profileImage: image)
                }) {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(Color("color-twitter"))
                        .frame(width: 350, height: 50)
                        .background(Color.white)
                        .clipShape(Capsule())
                }
                .padding()
                
                Spacer()
                
                Button(action: { mode.wrappedValue.dismiss() }) {
                    HStack {
                        Text("Already have an account ?")
                            .font(.system(size: 14))
                        
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundColor(.white)
                    .padding(.bottom, 40)
                }
//                HStack {
//                    Text("Already have an account ?")
//                        .font(.system(size: 14))
//
//                    Text("Sign In")
//                        .font(.system(size: 14, weight: .semibold))
//                }
//                .foregroundColor(.white)
//                .padding(.bottom, 40)
//                .onTapGesture {
//                    mode.wrappedValue.dismiss()
//                }
                    
            }
        }
        .background(Color("color-twitter"))
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
