//
//  AppetizerListVM.swift
//  Appetizers
//
//  Created by Steve Plavetzky on 11/15/21.
//

import SwiftUI

@MainActor final class AppetizerListVM: ObservableObject{
    //Main Actor makes anything done in this class is automatically switched to the main thread, DispatchQueue.main.async is no longer needed
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    /*
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
     */
    
    func getAppetizers() {
        
        isLoading = true
        Task {
            do{
                appetizers = try await NetworkManager.shared.getAppetizer()
                isLoading = false
            }catch{
                if let apError = error as? APError{
                    switch apError {
                        //only ones that would come through should be invalidURL or invalid data, but wanted to keep the other cases
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    default: alertItem = AlertContext.invalidResponse // generic error if wanted..
                    }
                } else {
                    alertItem = AlertContext.invalidResponse // generic error would go here
                    isLoading = false
                }

            }
        }
    }
    
}


