//
//  FeedCell.swift
//  InstagramWithBackend
//
//  Created by zuri cohen on 1/5/23.
//

import SwiftUI

struct FeedCell: View {
    
    @ObservedObject var feedCellVM: FeedCellViewModel
    
    var didLike: Bool { return feedCellVM.post.didLike ?? false } 
    
    init(viewModel: FeedCellViewModel) {
        self.feedCellVM = viewModel
    }
    
    var body: some View {
        
        LazyVStack(alignment: .leading) {
            
           header

            AsyncImage(url: URL(string: feedCellVM.post.imageUrl))
                .scaledToFill()
                .frame(maxHeight: 440)
                .frame(maxWidth: .infinity)
                .clipped()
            
            
            buttonActionSection
            
            
            
            Text(feedCellVM.likeString)
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 2)
            HStack {
                Text(feedCellVM.post.ownerUsername).font(.system(size: 14, weight: .semibold)) +
                Text(feedCellVM.post.caption)
                    .font(.system(size: 15))
            }.padding(.horizontal, 8)

            Text("2d").font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 8)
                .padding(.top, 4)
        }
    }
}

extension FeedCell {
    
    var header: some View {
        HStack {
            AsyncImage(url: URL(string: feedCellVM.post.ownerImageUrl))
        
                .scaledToFill()
                .frame(width: 36,height: 36)
                .clipped()
                .cornerRadius(18)
            Text(feedCellVM.post.ownerUsername)
                .font(.system(size: 14,
                              weight: .semibold))
        }
        .padding([.leading, .bottom], 8)
    }
    
    var buttonActionSection: some View {
        
        HStack(spacing: 16) {
            
            Button {
                
            } label: {
                Image(Theme.Images.comment)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .font(.system(size: 20))
                    .padding(4)
            }
            
            Button {
                
            } label: {
                
                Image(Theme.Images.save)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .font(.system(size: 20))
                    .padding(4)
            }
            
            Button {
                print("did tap like")
            } label: {
                
                Image(Theme.Images.heart)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .font(.system(size: 20))
                    .padding(4)
            }
            
            //----- Note that this code part causes a crash! ----//
            
            
//            Button {
//                self.didLike ? feedCellVM.unlike() : feedCellVM.like()
//            } label: {
//                Image(systemName: didLike ? "heart.fill" : "heart")
//                    .resizable()
//                    .scaledToFill()
//                foregroundColor( didLike ? .red : .black)
//                    .frame(width: 20, height: 20)
//                    .font(.system(size: 20))
//                    .padding(4)
//            }
            
            //----- Note that this code causes a crash! ----//
            
            
        }
        .padding(.leading, 4)
    }
}
