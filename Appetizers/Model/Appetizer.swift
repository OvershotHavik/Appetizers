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
    static let orderItem1 = Appetizer(id: 0001,
                                           name: "Test Appetizer 1",
                                           description: "This is the description for appetizer sample. It's Yummy!",
                                           price: 5.99,
                                           imageURL: "",
                                           calories: 100,
                                           carbs: 30,
                                           protein: 19)
    static let orderItem2 = Appetizer(id: 0002,
                                           name: "Test Appetizer 2",
                                           description: "This is the description for appetizer sample. It's Yummy!",
                                           price: 5.99,
                                           imageURL: "",
                                           calories: 100,
                                           carbs: 30,
                                           protein: 19)
    static let orderItem3 = Appetizer(id: 0003,
                                           name: "Test Appetizer 3",
                                           description: "This is the description for appetizer sample. It's Yummy!",
                                           price: 5.99,
                                           imageURL: "",
                                           calories: 100,
                                           carbs: 30,
                                           protein: 19)
    static let orderItems = [orderItem1, orderItem2, orderItem3]
}

