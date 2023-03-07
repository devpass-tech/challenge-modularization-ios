//
//  UserProfile.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 24/02/22.
//

import Foundation

public struct UserProfile: Decodable {
    public let name: String
    public let phone: String
    public let email: String
    public let address: String
    public let account: Account
}

public struct Account: Decodable {
    public let agency: String
    public let account: String
}
