//
//  HomeData.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 24/02/22.
//

import Foundation

public struct HomeData: Decodable {

    public let balance: Float
    public let savings: Float
    public let spending: Float
    public let activity: [Activity]
    
    public init(balance: Float, savings: Float, spending: Float, activity: [Activity]) {
        self.balance = balance
        self.savings = savings
        self.spending = spending
        self.activity = activity
    }
}

public struct Activity: Decodable {
    public let name: String
    public let price: Float
    public let time: String
    
    public init(name: String, price: Float, time: String) {
        self.name = name
        self.price = price
        self.time = time
    }
}
