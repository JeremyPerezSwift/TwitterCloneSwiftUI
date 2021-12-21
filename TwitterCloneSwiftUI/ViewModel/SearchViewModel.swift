//
//  SearchViewModel.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 21/12/2021.
//

import SwiftUI
import Firebase

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            self.users = documents.map({ User(dictionnary: $0.data()) })
            
            print("DEBUG: COLLECTION_USERS \(self.users)")
            
//            documents.forEach { document in
//                let user = User(dictionnary: document.data())
//                self.users.append(user)
//            }
        }
    }
}
