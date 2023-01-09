//
//  String+Extensions.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 24/02/22.
//

import Foundation

public extension String {

    static func activityDetails(with price: Float, and time: String) -> String {

        return "$\(price) • \(time)"
    }
}
