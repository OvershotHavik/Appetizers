//
//  APError.swift
//  Appetizers
//
//  Created by Steve Plavetzky on 11/15/21.
//

import Foundation

enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
