//
//  AccountVM.swift
//  Appetizers
//
//  Created by Steve Plavetzky on 11/16/21.
//

import SwiftUI

final class AccountVM: ObservableObject{
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthdate = Date()
    @Published var extraNapkins = false
    @Published var frequentRefills = false
    @Published var alertItem : AlertItem?
    
    var isValidForm: Bool {
        //Checks to make sure that first,last, and email fields are NOT empty
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty  else {
            alertItem = AlertContext.missingFields
            return false
        }
        
        guard email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    func saveChanges(){
        guard isValidForm else {return}
        print("changes have been saved successfully")
    }
}
