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
    
    init(name: String, phone: String, email: String, address: String, account: Account) {
        self.name = name
        self.phone = phone
        self.email = email
        self.address = address
        self.account = account
    }
}

public struct Account: Decodable {

    public let agency: String
    public let account: String
    
    public init(agency: String, account: String) {
        self.agency = agency
        self.account = account
    }
}
