//
//  OrderVM.swift
//  Appetizers
//
//  Created by Steve Plavetzky on 11/16/21.
//

import Foundation

final class OrderVM: ObservableObject{
    @Published var appetizers: [Appetizer] = []
    @Published var subTotal: Double = 0

    
}
