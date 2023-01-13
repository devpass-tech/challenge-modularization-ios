import Foundation
import Swinject
import SwinjectAutoregistration

import TransfersInterface
import Transfers

public class TransfersAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.autoregister(TransfersInterface.self, initializer: TransfersFactory.init)
    }
}
