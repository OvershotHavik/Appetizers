//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Steve Plavetzky on 11/17/21.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier{
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
            .padding()
    }
}

