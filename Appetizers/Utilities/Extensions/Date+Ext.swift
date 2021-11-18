//
//  Date+Ext.swift
//  Appetizers
//
//  Created by Steve Plavetzky on 11/18/21.
//

import Foundation

extension Date {
    var eighteenYearsAgo: Date{
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    var oneHundredTenYearsAgo: Date{
        Calendar.current.date(byAdding: .year, value: -110, to: Date())!
    }
}
