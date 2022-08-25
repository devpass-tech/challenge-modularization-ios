import Foundation
import SampleDomain

public protocol HomeServiceProtocol {
    func fetch(completion: @escaping (Result<[Activity], Error>) -> Void)
}

public final class HomeService: HomeServiceProtocol {
    private let getOrderedActivityListUseCase: GetOrderedActivityListUseCase

    public init(getOrderedActivityListUseCase: GetOrderedActivityListUseCase) {
        self.getOrderedActivityListUseCase = getOrderedActivityListUseCase
    }

    public func fetch(completion: @escaping (Result<[Activity], Error>) -> Void) {
        getOrderedActivityListUseCase.execute(completion: completion)
    }
}

