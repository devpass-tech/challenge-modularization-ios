//
//  Contact.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 24/02/22.
//

import Foundation

public struct Contact: Decodable {

    public let name: String
    public let phone: String
    
    public init(name: String, phone: String) {
        self.name = name
        self.phone = phone
    }
}
