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
    
    init(post: Post) {
        self.post = post
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
        
    }
    
}
