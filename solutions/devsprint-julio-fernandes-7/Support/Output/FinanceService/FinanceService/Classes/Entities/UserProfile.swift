//
//  UserProfile.swift
//  FinanceService
//
//  Created by Giuliano Accorsi on 04/11/22.
//

import Foundation

public struct UserProfile: Decodable {
    let name: String
    let phone: String
    let email: String
    let address: String
    let account: Account
}

public struct Account: Decodable {
    let agency: String
    let account: String
}
