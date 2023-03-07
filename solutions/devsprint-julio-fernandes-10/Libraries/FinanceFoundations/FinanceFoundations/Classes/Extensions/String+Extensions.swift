//
//  String+Extensions.swift
//  FinanceFoundations
//
//  Created by Philippe Muniz Gomes on 03/03/23.
//

import Foundation

extension String {

    public static func activityDetails(with price: Float, and time: String) -> String {
        return "$\(price) • \(time)"
    }
}
