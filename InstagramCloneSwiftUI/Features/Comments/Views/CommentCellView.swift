//
//  CommentCellView.swift
//  InstagramCloneSwiftUI
//
//  Created by zuri cohen on 30/04/2023.
//

import SwiftUI

struct CommentCellView: View {
    
    var body: some View {
        
        HStack {
            Image(Theme.Images.profile_3)
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
            
            Text("batman").font(.system(size: 14, weight: .semibold)) +
            Text(" some test comment for now").font(.system(size: 14))
            
            Spacer()
            
            Text("2m")
                .foregroundColor(.gray)
                .font(.system(size: 12))
            
        }.padding(.horizontal)
    }
}

struct CommentCellView_Previews: PreviewProvider {
    static var previews: some View {
        CommentCellView()
    }
}
