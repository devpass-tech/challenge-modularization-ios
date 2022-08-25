import Network
import SampleData
import SampleDomain
import SampleUI
import UIKit

enum SampleFactory {
    static func make() -> UIViewController {
        let cache = ActivityCache.shared
        let cacheDataSource = GetActivityListCacheDataSource(cache: cache)

        let network = NetworkManager()
        let apiDataSource = GetActivityListApiDataSource(network: network)

        let repository = SampleData.GetActivityListRepository(
            primaryDataSource: cacheDataSource,
            secondaryDataSource: apiDataSource
        )
        let getActivityListUseCase = GetActivityList(repository: repository)

        let getOrderedActivityListUseCase = GetOrderedActivityListUseCaseFactory.make()

        let service = SampleService(
            getActivityListUseCase: getActivityListUseCase,
            getOrderedActivityListUseCase: getOrderedActivityListUseCase
        )

        let view = SampleView()
        let sampleViewController = SampleViewController(customView: view, service: service)
        view.delegate = sampleViewController

        return sampleViewController
    }
}

enum GetOrderedActivityListUseCaseFactory {
    static func make() -> GetOrderedActivityListUseCase {
        let cache = ActivityCache.shared
        let cacheDataSource = GetActivityListCacheDataSource(cache: cache)

        let network = NetworkManager()
        let apiDataSource = GetActivityListApiDataSource(network: network)

        let repository = SampleData.GetActivityListRepository(
            primaryDataSource: cacheDataSource,
            secondaryDataSource: apiDataSource
        )

        return GetOrderedActivityList(repository: repository)
    }
}
