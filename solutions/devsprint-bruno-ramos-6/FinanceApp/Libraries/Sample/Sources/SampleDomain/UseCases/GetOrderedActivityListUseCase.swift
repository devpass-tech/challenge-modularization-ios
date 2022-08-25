import Foundation

public protocol GetOrderedActivityListUseCase {
    func execute(completion: @escaping (Result<[Activity], Error>) -> Void)
}

public final class GetOrderedActivityList: GetOrderedActivityListUseCase {
    private let repository: GetActivityListRepository

    public init(repository: GetActivityListRepository) {
        self.repository = repository
    }

    public func execute(completion: @escaping (Result<[Activity], Error>) -> Void) {
        repository.getActivityList {
            switch $0 {
            case .success(let activities):
                let orderedList = Array(activities.reversed())
                completion(.success(orderedList))
            case .failure(_):
                completion(.failure(GetOrderedActivityListError()))
            }
        }
    }

    struct GetOrderedActivityListError: Error {}
}
