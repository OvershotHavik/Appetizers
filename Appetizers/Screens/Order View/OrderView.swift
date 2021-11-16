//
//  OrderView.swift
//  Appetizers
//
//  Created by Steve Plavetzky on 11/15/21.
//

import SwiftUI

struct OrderView: View {
    @StateObject var viewModel = OrderVM()
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView{
            ZStack{
                
                VStack{
                    List{
                        ForEach(order.items) { appetizer in
                            AppetizerCell(appetizer: appetizer)
                        }
                        //Cleaner version:
                        .onDelete(perform: order.deleteItem)
                        /*
                         Original way that spelled out
                         .onDelete(perform: { indexSet in
                             orderItems.remove(atOffsets: indexSet)
                         })
                         */
                        
                        
                    }
                    .listStyle(.plain)
                    

                    Button {
                        
                    } label: {
                        APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order ")
                    }

                }
                
                if order.items.isEmpty{
                    EmptyState(imageName: "empty-order",
                               message: "You have no items in your order. \nPlease add an appetizer!")
                }
            }

            .navigationTitle("🧾 Orders")
            
            
            
            
        }
    }
    

    
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
