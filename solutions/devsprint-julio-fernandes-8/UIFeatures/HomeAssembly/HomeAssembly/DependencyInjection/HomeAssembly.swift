import Foundation
import Swinject
import SwinjectAutoregistration

import HomeInterface
import Home

public class HomeAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.register(String.self) { _ in
            return "Hello DI!!!"
        }
        container.autoregister(HomeInterface.self, initializer: HomeInitializer.init)
    }
}
