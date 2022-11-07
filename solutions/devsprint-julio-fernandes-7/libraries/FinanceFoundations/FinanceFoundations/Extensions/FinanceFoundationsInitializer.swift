//
//  FinanceFoundationsInitializer.swift
//  FinanceFoundations
//

import Foundation


extension String {

    public func activityDetails(with price: Float, and time: String) -> String {

        return "$\(price) • \(time)"
    }
}
