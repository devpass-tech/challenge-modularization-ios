//
//  MainQueueDecorator.swift
//  FinanceService
//
//  Created by Thonatas Borges on 3/4/23.
//

import Foundation

public struct MainQueueDecorator: FinanceServiceProtocol {
    let decoratee: FinanceServiceProtocol
    
    public init(decoratee: FinanceServiceProtocol) {
        self.decoratee = decoratee
    }
    
    public func fetchData<T: Decodable>(_: T.Type, endpoint: FinanceEndpoint, _ completion: @escaping (Result<T, Error>) -> Void) {
        decoratee.fetchData(T.self, endpoint: endpoint) { (result) in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
