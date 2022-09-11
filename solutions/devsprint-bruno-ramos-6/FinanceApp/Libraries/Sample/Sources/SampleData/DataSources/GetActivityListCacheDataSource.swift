import Foundation
import SampleDomain

public final class GetActivityListCacheDataSource: GetActivityListDataSource {
    private let cache: ActivityCacheProtocol

    public init(cache: ActivityCacheProtocol) {
        self.cache = cache
    }

    public func fetchActivityList(completion: @escaping (Result<[Activity], Error>) -> Void) {
        let activities = cache.getActivities()

        guard !activities.isEmpty else {
            completion(.failure(ActivityListCacheEmptyError()))
            return
        }

        completion(.success(activities))
    }

    struct ActivityListCacheEmptyError: Error {}
}

// Cache

public protocol ActivityCacheProtocol {
    func getActivities() -> [Activity]
    func set(activities: [Activity])

}

public final class ActivityCache: ActivityCacheProtocol {
    public static let shared = ActivityCache()

    private init() {}

    private var _activities: [Activity] = []

    public func getActivities() -> [Activity] {
        _activities
    }

    public func set(activities: [Activity]) {
        _activities.append(contentsOf: activities)
    }
}
