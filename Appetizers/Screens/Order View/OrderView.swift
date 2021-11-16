//
//  OrderView.swift
//  Appetizers
//
//  Created by Steve Plavetzky on 11/15/21.
//

import SwiftUI

struct OrderView: View {
    @StateObject var viewModel = OrderVM()
    @State private var orderItems = MockData.orderItems
    var body: some View {
        NavigationView{
            VStack{
                
                List{
                    ForEach(orderItems) { appetizer in
                        AppetizerCell(appetizer: appetizer)
                    }
                    //Cleaner version:
                    .onDelete(perform: deleteItem)
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
                    APButton(title: "$\(viewModel.subTotal, specifier: "%.2f") - Place Order ")
                }

            }
            .navigationTitle("🧾 Orders")

            
            
            
        }
    }
    
    func deleteItem(at offsets: IndexSet){
        orderItems.remove(atOffsets: offsets)
    }
    
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
