//
//  SearchViewModel.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/14/23.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init() {
        self.fetchUsers()
    }

    func fetchUsers() {
        print("fetchUsers - start")
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.users = documents.compactMap({try? $0.data(as: User.self)})
            print("fetchUsers - end \(self.users.count)")
        }
    }
    
    func filteredUsers(_ query: String) -> [User] {
        let lowercaseQuery = query.lowercased()
        return users.filter({$0.fullName.lowercased().contains(lowercaseQuery) || $0.userName.contains(lowercaseQuery)})
    }
}
