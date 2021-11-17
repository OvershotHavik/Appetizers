//
//  Order.swift
//  Appetizers
//
//  Created by Steve Plavetzky on 11/16/21.
//

import SwiftUI

final class Order: ObservableObject{
    
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double{
        items.reduce(0) {$0 + $1.price}
        //Check on the environment Object video for details on this
    }
    func add(_ appetizer: Appetizer){
        items.append(appetizer)
    }
    
    func deleteItem(at offsets: IndexSet){
        items.remove(atOffsets: offsets)
    }
}

