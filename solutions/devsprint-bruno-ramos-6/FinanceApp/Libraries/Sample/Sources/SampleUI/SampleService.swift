import Foundation
import SampleDomain

public protocol SampleServiceProtocol {
    func fetch(completion: @escaping (Result<[Activity], Error>) -> Void)
}

public final class SampleService: SampleServiceProtocol {
    private let getActivityListUseCase: GetActivityListUseCase
    private let getOrderedActivityListUseCase: GetOrderedActivityListUseCase

    public init(getActivityListUseCase: GetActivityListUseCase, getOrderedActivityListUseCase: GetOrderedActivityListUseCase) {
        self.getActivityListUseCase = getActivityListUseCase
        self.getOrderedActivityListUseCase = getOrderedActivityListUseCase
    }

    public func fetch(completion: @escaping (Result<[Activity], Error>) -> Void) {
        getOrderedActivityListUseCase.execute(completion: completion)
    }
}

