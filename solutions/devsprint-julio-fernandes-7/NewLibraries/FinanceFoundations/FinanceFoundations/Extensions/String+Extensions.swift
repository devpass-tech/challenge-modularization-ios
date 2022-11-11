//
//  String+Extensions.swift
//  FinanceFoundations
//
//  Created by Gustavo Fernandes on 07/11/22.
//

import Foundation

extension String {

    @discardableResult
    public static func activityDetails(with price: Float, and time: String) -> String {
        return "$\(price) • \(time)"
    }
}
