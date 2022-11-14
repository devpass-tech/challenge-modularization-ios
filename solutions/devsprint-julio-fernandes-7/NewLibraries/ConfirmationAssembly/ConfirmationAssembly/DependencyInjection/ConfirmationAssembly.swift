import Foundation
import Swinject
import SwinjectAutoregistration

import ConfirmationInterface
import Confirmation

public class ConfirmationAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.autoregister(ConfirmationInterface.self, initializer: ConfirmationFactory.init)
    }
}
