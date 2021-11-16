//
//  User.swift
//  Appetizers
//
//  Created by Steve Plavetzky on 11/16/21.
//

import Foundation

struct User: Codable{
    
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthdate       = Date()
    var extraNapkins    = false
    var frequentRefills = false
}
