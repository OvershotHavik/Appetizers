//
//  AppetizerListVM.swift
//  Appetizers
//
//  Created by Steve Plavetzky on 11/15/21.
//

import SwiftUI

final class AppetizerListVM: ObservableObject{
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
    func getAppetizers() {
        
        isLoading = true
        
        NetworkManager.shared.getAppetizer { [self] result in // Capture self up here so then you don't need to specify on each case. New in swift 5.3
            DispatchQueue.main.async {
                isLoading = false
                switch result{
                case .success(let appetizers):
                    self.appetizers = appetizers
                    
                case .failure(let error):
                    switch error{
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    default: print("Not setup in getAppetizers switch")
                    }
                }
            }
        }
    }
}


