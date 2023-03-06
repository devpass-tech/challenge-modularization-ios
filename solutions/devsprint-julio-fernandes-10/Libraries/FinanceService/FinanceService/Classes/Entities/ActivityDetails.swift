//
//  ActivityDetails.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 24/02/22.
//

import Foundation

public struct ActivityDetails: Decodable {
    public let name: String
    public let price: Float
    public let category: String
    public let time: String
}
