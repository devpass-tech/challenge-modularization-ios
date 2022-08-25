import Foundation
import SampleDomain

public final class GetActivityListRepository: SampleDomain.GetActivityListRepository {
    private let primaryDataSource: GetActivityListDataSource
    private let secondaryDataSource: GetActivityListDataSource

    public init(primaryDataSource: GetActivityListDataSource, secondaryDataSource: GetActivityListDataSource) {
        self.primaryDataSource = primaryDataSource
        self.secondaryDataSource = secondaryDataSource
    }

    public func getActivityList(completion: @escaping (Result<[Activity], Error>) -> Void) {
        primaryDataSource.fetchActivityList { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let activities):
                completion(.success(activities))
            case .failure(_):
                self.secondaryDataSource.fetchActivityList(completion: completion)
            }
        }
    }
}
