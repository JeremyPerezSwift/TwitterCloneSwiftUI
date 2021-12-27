//
//  SearchViewModel.swift
//  TwitterCloneSwiftUI
//
//  Created by Jérémy Perez on 21/12/2021.
//

import SwiftUI
import Firebase

enum SearchViewModelConfiguration {
    case search
    case newMessage
}

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    private let config: SearchViewModelConfiguration
    
    init(config: SearchViewModelConfiguration) {
        self.config = config
        fetchUsers(forConfig: config)
    }
    
    func fetchUsers(forConfig config: SearchViewModelConfiguration) {
        COLLECTION_USERS.getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            let users = documents.map({ User(dictionnary: $0.data()) })
            
            switch config {
            case .search:
                self.users = users
            case .newMessage:
                self.users = users.filter({ !$0.isCurrentUser })
            }
        }
    }
    
    func filterdUsers(_ query: String) -> [User] {
        return users.filter({ $0.fullname.lowercased().contains(query.lowercased()) || $0.username.contains(query.lowercased()) })
    }
    
}
