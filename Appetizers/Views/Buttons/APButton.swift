//
//  APButton.swift
//  Appetizers
//
//  Created by Steve Plavetzky on 11/16/21.
//

import SwiftUI

struct APButton: View {
    var title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundColor(Color.white)
            .frame(width: 260, height: 50)
            .background(Color.brandPrimary)
            .padding(.bottom, 30)
    }
}

struct APButton_Previews: PreviewProvider {
    static var previews: some View {
        APButton(title: "Test Title")
    }
}
