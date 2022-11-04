//
//  ActivityDetail.swift
//  FinanceService
//
//  Created by Giuliano Accorsi on 04/11/22.
//

import Foundation

public struct ActivityDetails: Decodable {
    let name: String
    let price: Float
    let category: String
    let time: String
}
