//
//  AppetizerDetailVM.swift
//  Appetizers
//
//  Created by Steve Plavetzky on 11/16/21.
//

import Foundation

final class AppetizerDetailVM: ObservableObject{
    @Published var appetizer: Appetizer
    
    init(appetizer: Appetizer){
        self.appetizer = appetizer
    }
    
    
}
