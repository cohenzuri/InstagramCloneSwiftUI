//
//  Notification.swift
//  InstagramCloneSwiftUI
//
//  Created by zuri cohen on 30/04/2023.
//

import FirebaseFirestoreSwift
import Firebase

struct Notification: Identifiable, Decodable {
    @DocumentID var id: String?
    var postId: String?
    var username: String
    var profileImageUrl: String
    var timestamp: Timestamp
    var type: Int
    let uid: String
}

enum NotificationType: Int, Decodable {
    case like
    case comment
    case follow
    
    var notificationMessage: String {
        
        switch self {
        case .like: return " liked one of your posts."
        case .comment: return " commented on one of your posts."
        case .follow: return " started following you."
        }
    }
}
