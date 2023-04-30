//
//  CustomInputView.swift
//  InstagramCloneSwiftUI
//
//  Created by zuri cohen on 30/04/2023.
//

import SwiftUI

struct CustomInputView: View {
    
    @Binding var inputText: String
    var action: () -> Void
    
    var body: some View {
        
        VStack {
        
            Divider()
                    
            HStack {
                
                TextField("Comment...", text: $inputText)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(minHeight: 30)
                
                Button {
                    action()
                } label: {
                    Text("Send")
                        .bold()
                        .foregroundColor(.white)
                }

            }
            .padding()
        }
    }
}
