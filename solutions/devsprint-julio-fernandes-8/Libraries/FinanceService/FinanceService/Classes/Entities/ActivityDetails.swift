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
    
    public init(name: String, price: Float, category: String, time: String) {
        self.name = name
        self.price = price
        self.category = category
        self.time = time
    }
}
