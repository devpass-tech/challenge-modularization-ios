import Foundation
import Swinject
import SwinjectAutoregistration

import ActivityDetailsInterface
import ActivityDetails

public class ActivityDetailsAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        // Forma 1
//        container.register(ActivityDetailsInterface.self) { _ in
//            return ActivityDetailsFactory()
//        }
        
        // Forma 2
        container.autoregister(ActivityDetailsInterface.self, initializer: ActivityDetailsFactory.init)
    }
}
