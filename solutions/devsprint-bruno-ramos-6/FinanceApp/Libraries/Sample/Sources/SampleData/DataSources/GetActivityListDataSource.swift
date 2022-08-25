import SampleDomain

public protocol GetActivityListDataSource {
    func fetchActivityList(completion: @escaping (Result<[Activity], Error>) -> Void)
}
