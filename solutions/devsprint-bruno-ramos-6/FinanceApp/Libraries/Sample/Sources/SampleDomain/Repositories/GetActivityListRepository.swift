public protocol GetActivityListRepository {
    func getActivityList(completion: @escaping (Result<[Activity], Error>) -> Void)
}
