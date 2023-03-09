import Foundation
import Swinject
import SwinjectAutoregistration

import HomeInterface
import Home

public class HomeAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.autoregister(HomeInterface.self, initializer: HomeFactory.init)
    }
}
