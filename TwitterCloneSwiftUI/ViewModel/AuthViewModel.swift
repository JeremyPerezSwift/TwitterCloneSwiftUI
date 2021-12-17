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
        
        guard let imageDate = profileImage.jpegData(compressionQuality: 0.3) else { return }
        let fileImage = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(fileImage)
        
        storageRef.putData(imageDate, metadata: nil) { _, error in
            if let err = error {
                print("DEBUG: Failed to upload image \(err.localizedDescription)")
                return
            } else {
                print("DEBUG: Succesfully uploaded user photo")
                
                storageRef.downloadURL { url, _ in
                    guard let profileImageUrl = url?.absoluteString else { return }
                    
                    Auth.auth().createUser(withEmail: email, password: password) { result, error2 in
                        if let err = error2 {
                            print("DEBUG: Error \(err.localizedDescription)")
                            return
                        } else {
                            
                            guard let use = result?.user else { return }
                            
                            let data = ["email": email, "username": username, "fullname": fullname, "profileImageUrl": profileImageUrl, "uid": use.uid]
                            
                            Firestore.firestore().collection("users").document(use.uid).setData(data) { error3 in
                                if let err = error3 {
                                    print("DEBUG: Error Firestore \(err.localizedDescription)")
                                } else {
                                    print("DEBUG: Succesfully uploaded user data")
                                }
                            }
                        }
                    }
                    
                }
                
            }
        }
    
    }
    
}
