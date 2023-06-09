//
//  FeedCellViewModel.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/31/23.
//

import Foundation
import Firebase

class FeedCellViewModel: ObservableObject {
    
    @Published var post: Post
    
    var likeString: String {
        let label = post.likes == 1 ? "like" : "likes"
        return "\(post.likes) \(label)"
    }
    
    init(post: Post) {
        self.post = post
        self.checkIfUserLikedPost()
    }
    
    func like() {
        guard let uid = AuthenticationViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        
        COLLECTION_POSTS.document(postId).collection("post-likes")
            .document(uid).setData([:]) { _ in
                COLLECTION_USERS.document(uid).collection("user-likes")
                    .document(postId).setData([:]) { _ in
                        
                        COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes + 1])
                        
                        self.post.didLike = true
                        self.post.likes += 1
                    }
            }
    }
    
    func unlike() { // TODO: this code is very similar to the like functionality so need to find way to implament this in the same code!
        
        guard post.likes > 0 else { return }
        guard let uid = AuthenticationViewModel.shared.userSession?.uid else { return } //TODO: maybe this variable need to be global it use all over the class
        guard let postId = post.id else { return }
        
        COLLECTION_POSTS.document(postId).collection("post-likes")
            .document(uid).delete { _ in
                
                COLLECTION_USERS.document(uid).collection("user-likes")
                    .document(postId).delete { _ in
                        
                        COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes - 1])
                        
                        self.post.didLike = false
                        self.post.likes -= 1
                        
                    }
            }
    }
    
    func checkIfUserLikedPost() {
        
        guard let uid = AuthenticationViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        
        COLLECTION_USERS.document(uid).collection("user-likes").document(postId).getDocument { snapshot, _ in
            guard let didLike = snapshot?.exists else { return }
            self.post.didLike = didLike
        }
    }
}
