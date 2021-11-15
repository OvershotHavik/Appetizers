//
//  OrderView.swift
//  Appetizers
//
//  Created by Steve Plavetzky on 11/15/21.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        NavigationView{
            Text("Orders")
                .navigationTitle("🧾 Orders")
        }    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
