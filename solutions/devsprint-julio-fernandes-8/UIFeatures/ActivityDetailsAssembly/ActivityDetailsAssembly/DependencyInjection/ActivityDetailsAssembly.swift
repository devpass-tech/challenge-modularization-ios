import Foundation
import Swinject
import SwinjectAutoregistration

import ActivityDetailsInterface
import ActivityDetails

public class ActivityDetailsAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.autoregister(ActivityDetailsInterface.self, initializer: ActivityDetailsFactory.init)
    }
}
