import Foundation
import Swinject
import SwinjectAutoregistration

import FinanceServiceInterface
import FinanceService

public class FinanceServiceAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.register(FinanceServiceInterface.self) { _ in FinanceService(session: .shared) }
    }
}
