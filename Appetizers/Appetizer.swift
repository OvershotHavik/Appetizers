//
//  Appetizer.swift
//  Appetizers
//
//  Created by Steve Plavetzky on 11/15/21.
//

import Foundation

struct Appetizer: Decodable, Identifiable{
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let carbs: Int
    let protein: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData{
    static let sampleAppetizer = Appetizer(id: 0001,
                                           name: "Test Appetizer",
                                           description: "This is the description for appetizer sample. It's Yummy!",
                                           price: 5.99,
                                           imageURL: "",
                                           calories: 100,
                                           carbs: 30,
                                           protein: 19)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}

