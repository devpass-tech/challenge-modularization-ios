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
}

public struct Activity: Decodable {
    public let name: String
    public let price: Float
    public let time: String
}
