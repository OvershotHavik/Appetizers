//
//  AccountVM.swift
//  Appetizers
//
//  Created by Steve Plavetzky on 11/16/21.
//

import SwiftUI

final class AccountVM: ObservableObject{
    @AppStorage("user") private var userData: Data?
    
    @Published var user = User()
    @Published var alertItem : AlertItem?
    
    var isValidForm: Bool {
        //Checks to make sure that first,last, and email fields are NOT empty
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty  else {
            alertItem = AlertContext.missingFields
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    func saveChanges(){
        //First make sure the information is valid
        guard isValidForm else {return}
        
        //Then encode it to data and alert accordingly
        do{
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        }catch{
            alertItem = AlertContext.invalidUserData
        }
    }
    
    
    func retrieveUser(){
        guard let userData = userData else { return }
        
        do{
            user = try JSONDecoder().decode(User.self, from: userData)
        }catch {
            alertItem = AlertContext.invalidUserData
        }
    }
}
