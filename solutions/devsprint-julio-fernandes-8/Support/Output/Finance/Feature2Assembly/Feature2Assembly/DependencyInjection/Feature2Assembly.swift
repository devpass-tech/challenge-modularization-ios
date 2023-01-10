import Foundation
import Swinject
import SwinjectAutoregistration

import Feature2Interface
import Feature2

public class Feature2Assembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.register(String.self) { _ in
            return "Hello DI!!!"
        }
        container.autoregister(Feature2Interface.self, initializer: Feature2Initializer.init)
    }
}
