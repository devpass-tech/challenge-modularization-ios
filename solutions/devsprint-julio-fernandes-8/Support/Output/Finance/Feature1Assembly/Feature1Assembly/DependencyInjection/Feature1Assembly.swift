import Foundation
import Swinject
import SwinjectAutoregistration

import Feature1Interface
import Feature1

public class Feature1Assembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.register(String.self) { _ in
            return "Hello DI!!!"
        }
        container.autoregister(Feature1Interface.self, initializer: Feature1Initializer.init)
    }
}
