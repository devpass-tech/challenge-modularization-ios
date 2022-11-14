//
//  FinanceServiceInterface.swift
//  FinanceServiceInterface
//

import Foundation

public enum FinanceEndpoint: String {
    case home = "home_endpoint"
    case contactList = "contact_list_endpoint"
    case userProfile = "user_profile_endpoint"
    case transfer = "transfer_successful_endpoint"
}

public enum FinanceServiceError: Error {
    case decode, invalidData, invalidURL
}

public protocol FinanceServiceInterface {
    func load<T: Decodable>(endpoint: FinanceEndpoint, completion: @escaping (Result<T, Error>) -> Void)
    func cancel()
}
