//
//  FinanceServiceInitializer.swift
//  FinanceService
//

import Foundation
import FinanceServiceInterface

public final class FinanceService {
    
    private var session: URLSession
    private var dataTask: URLSessionDataTask?
    
    public init(session: URLSession) {
        self.session = session
    }
    
}

extension FinanceService: FinanceServiceInterface {
    public func load<T: Decodable>(endpoint: FinanceEndpoint, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-viper-finance/main/api/\(endpoint.rawValue).json") else {
            completion(.failure(FinanceServiceError.invalidURL))
            return
        }
        let request = URLRequest(url: url)
        dataTask = session.dataTask(with: request, completionHandler: { data, response, error in
            guard let data = data else {
                completion(.failure(FinanceServiceError.invalidData))
                return
            }
            guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
                completion(.failure(FinanceServiceError.decode))
                return
            }
            completion(.success(decodedData))
        })

        dataTask?.resume()
    }

    public func cancel() {
        self.dataTask?.cancel()
    }
    
}
