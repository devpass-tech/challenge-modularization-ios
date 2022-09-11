import Foundation
import SampleDomain
import Network

public final class GetActivityListApiDataSource: GetActivityListDataSource {
    private let network: NetworkManagerProtocol

    public init(network: NetworkManagerProtocol) {
        self.network = network
    }

    public func fetchActivityList(completion: @escaping (Result<[Activity], Error>) -> Void) {
        network.request(url: URL(string: "www.devpass.com.br/modularization/activity_list.json")!) { result in
            switch result {
            case .success(let data):
                guard let activityResponseList = try? JSONDecoder().decode([ActivityResponse].self, from: data) else {
                    completion(.failure(GetActivityListApiDataSourceSerializeError()))
                    return
                }

                let activityDomainList = activityResponseList.map(ActivityResponseMapper.map)
                completion(.success(activityDomainList))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    struct GetActivityListApiDataSourceSerializeError: Error {}
}
