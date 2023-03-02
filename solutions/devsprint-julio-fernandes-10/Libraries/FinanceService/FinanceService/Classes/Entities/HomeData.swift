//
//  HomeData.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 24/02/22.
//

import Foundation

public struct HomeData: Decodable {
    let balance: Float
    let savings: Float
    let spending: Float
    let activity: [Activity]
}

public struct Activity: Decodable {
    let name: String
    let price: Float
    let time: String
}
