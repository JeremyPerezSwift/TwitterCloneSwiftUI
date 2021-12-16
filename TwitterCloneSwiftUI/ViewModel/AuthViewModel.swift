//
//  AuthViewModel.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 16/12/2021.
//

import UIKit
import Firebase

class AuthViewModel: ObservableObject {
    
    func login() {
        
    }
    
    func registerUser(email: String, password: String, username: String, fullname: String, profileImage: UIImage) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let err = error {
                print("DEBUG: Error \(err)")
            } else {
                print("DEBUG: Successfully signed up user")
            }
        }
    }
    
}
