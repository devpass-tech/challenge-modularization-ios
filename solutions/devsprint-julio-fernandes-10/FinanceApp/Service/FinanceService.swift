//
//  FinanceService.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import Foundation

enum FinanceEndpoint: String {
    case home = "home_endpoint"
    case contactList = "contact_list_endpoint"
    case userProfile = "user_profile_endpoint"
    case transfer = "transfer_successful_endpoint"
}

final class FinanceService {
    private let baseURL = "https://raw.githubusercontent.com/devpass-tech/challenge-finance-app/main/api/"
    
    func fetchData<T: Decodable>(_: T.Type, endpoint: FinanceEndpoint, _ completion: @escaping (T?) -> Void) {
        guard let url = URL(string: baseURL + endpoint.rawValue + ".json") else {
            print("Invalid URL")
            completion(nil)
            return
        }

        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion(nil)
                return
            }

            guard let data = data else {
                print("Invalid Data")
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let result: T = try decoder.decode(T.self, from: data)
                completion(result)
            } catch {
                print(error)
                completion(nil)
            }
        }

        dataTask.resume()
    }
}
