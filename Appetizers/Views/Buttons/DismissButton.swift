//
//  DismissButton.swift
//  Appetizers
//
//  Created by Steve Plavetzky on 11/16/21.
//

import SwiftUI

struct DismissButton: View {
    @Binding var isShowingDetail: Bool
    
    var body: some View{
        Button {
            isShowingDetail = false
        } label: {
            ZStack{
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .opacity(0.6)
                
                Image(systemName: "xmark")
                    .frame(width: 44, height: 44)
                    .imageScale(.small)
                    .foregroundColor(.black)
            }
        }
    }
}

struct DismissButton_Previews: PreviewProvider {
    static var previews: some View {
        DismissButton(isShowingDetail: .constant(true))
    }
}
