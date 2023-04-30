//
//  ProfileHeaderView.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/8/23.
//
// github token: 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

import SwiftUI

struct ProfileHeaderView: View {
    
    @ObservedObject var profileVm: ProfileViewModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack(spacing: 16) {
                
                AsyncImage(url: URL(string: profileVm.user.profileImageUrl))
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
                
                UserStatView(value: 5, title: "Post")
                UserStatView(value: 2, title: "Following")
                UserStatView(value: 4, title: "Followers")
                
            }
            .padding(.trailing, 32)
            
            Text(profileVm.user.fullName)
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            
            Text("Gothams Dark kingth || Billionere")
                .font(.system(size: 15))
                .padding(.leading)
                .padding(.top, 1)
            
            HStack {
                Spacer()
                ProfileActionButtonView(profileVm: profileVm)
                Spacer()
            }
            Spacer()
        }
    }
}
