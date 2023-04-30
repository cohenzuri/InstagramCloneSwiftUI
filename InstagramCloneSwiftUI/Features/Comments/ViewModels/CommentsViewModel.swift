//
//  CommentsViewModel.swift
//  InstagramCloneSwiftUI
//
//  Created by zuri cohen on 30/04/2023.
//

import Foundation
import Firebase

class CommentViewModel: ObservableObject {
    
    private let post: Post
    @Published var comments = [Comment]()
    
    init(post: Post) {
        self.post = post
        self.fetchComments()
    }
    
    func uploadComment(commentText: String) {
        
        guard let user = AuthenticationViewModel.shared.currentUser else { return }
        guard let postId = post.id else { return }
        
        let data: [String: Any] = [
            
            "username": user.userName,
            "profileImageUrl": user.profileImageUrl,
            "uid": user.id ?? "",
            "timestamp": Timestamp(date: Date()),
            "ownerUid": post.ownerUid,
            "commentText": commentText

        ]
            
        COLLECTION_POSTS.document(postId).collection("post-comments").addDocument(data: data) { error in
            
            if let error = error {
                print("DEBUG: Error uploading comment \(error.localizedDescription)")
                return
            }
        }
    }
    
    func fetchComments() {
        
        guard let postId = post.id else { return }
        let query = COLLECTION_POSTS.document(postId).collection("post-comments").order(by: "timestamp", descending: true)
        
        query.addSnapshotListener { snapshot, _ in
            guard let addedDocs = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            print("new comments: \(addedDocs.last?.description)")
            self.comments.append(contentsOf: addedDocs.compactMap({ try? $0.document.data(as: Comment.self )}))
        }
    }
 
}
