//
//  CommentsView.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/5/23.
//

import SwiftUI

struct CommentsView: View {
    
    @ObservedObject var commentVm: CommentViewModel
    @State var commentText = ""
    
    init(post: Post) {
        self.commentVm = CommentViewModel(post: post)
    }
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack(alignment: .leading, spacing: 24) {
                
                ForEach(commentVm.comments) { comment in
                    CommentCellView(comment: comment)
                }
                
            }.padding(.top)
        }
    
        CustomInputView(inputText: $commentText, action: uploadComment)
        
    }
    
    func uploadComment() { 
        self.commentVm.uploadComment(commentText: commentText)
        self.commentText = ""
    }
}

