import Foundation
import Swinject
import SwinjectAutoregistration

import TransfersInterface
import Transfers

public class TransfersAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.register(String.self) { _ in
            return "Hello DI!!!"
        }
        container.autoregister(TransfersInterface.self, initializer: TransfersFactory.init)
    }
}
