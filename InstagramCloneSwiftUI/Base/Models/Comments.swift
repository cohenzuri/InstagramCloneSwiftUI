//
//  Comments.swift
//  InstagramCloneSwiftUI
//
//  Created by zuri cohen on 30/04/2023.
//

import FirebaseFirestoreSwift
import Firebase

struct Comment: Identifiable, Decodable {
    
    @DocumentID var id: String?
    let username: String
    let ownerUid: String
    let profileImageUrl: String
    let commentText: String
    let timestamp: Timestamp
    let uid: String //?
    
}
