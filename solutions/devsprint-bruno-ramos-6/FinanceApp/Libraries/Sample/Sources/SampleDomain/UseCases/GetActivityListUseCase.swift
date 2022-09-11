import Foundation

public protocol GetActivityListUseCase {
    func execute(completion: @escaping (Result<[Activity], Error>) -> Void)
}

public final class GetActivityList: GetActivityListUseCase {
    private let repository: GetActivityListRepository

    public init(repository: GetActivityListRepository) {
        self.repository = repository
    }
    
    public func execute(completion: @escaping (Result<[Activity], Error>) -> Void) {
        repository.getActivityList(completion: completion)
    }
}
