//
//  CommentCellView.swift
//  InstagramCloneSwiftUI
//
//  Created by zuri cohen on 30/04/2023.
//

import SwiftUI

struct CommentCellView: View {
    
    let comment: Comment
    
    var body: some View {
        
        HStack {
           
            AsyncImage(url: URL(string: comment.profileImageUrl))
            
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
            
            Text(comment.username).font(.system(size: 14, weight: .semibold)) +
            Text(comment.commentText).font(.system(size: 14))
            
            Spacer()
            
            Text("2m")
                .foregroundColor(.gray)
                .font(.system(size: 12))
            
        }.padding(.horizontal)
    }
}
