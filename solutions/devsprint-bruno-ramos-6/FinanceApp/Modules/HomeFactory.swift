import Foundation
import UIKit
import Home

enum HomeFactory {
    static func make() -> UIViewController {
        let service = HomeService(getOrderedActivityListUseCase: GetOrderedActivityListUseCaseFactory.make())
        return HomeViewController(service: service)
    }
}
