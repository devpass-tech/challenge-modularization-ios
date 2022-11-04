//
//  String+Extensions.swift
//  FinanceFoundations
//

import Foundation

extension String {

        static func activityDetails(with price: Float, and time: String) -> String {

            return "$\(price) • \(time)"
        }
    }
