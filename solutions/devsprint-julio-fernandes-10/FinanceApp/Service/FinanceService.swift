//
//  FinanceService.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

enum FinanceServiceError: Error {
    case invalidURL
    case invalidData
    case parse
}

enum FinanceEndpoint: String {
    case home = "home_endpoint"
    case activityDetails = "activity_details_endpoint"
    case contactList = "contact_list_endpoint"
    case userProfile = "user_profile_endpoint"
    case transfer = "transfer_successful_endpoint"
}

final class FinanceService {
    private let baseURL = "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/"
    
    func fetchData<T: Decodable>(_: T.Type, endpoint: FinanceEndpoint, _ completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: baseURL + endpoint.rawValue + ".json") else {
            completion(.failure(FinanceServiceError.invalidURL))
            return
        }

        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completion(.failure(FinanceServiceError.invalidData))
                return
            }
            guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
                completion(.failure(FinanceServiceError.parse))
                return
            }
            
            completion(.success(decodedData))
        }

        dataTask.resume()
    }
}
