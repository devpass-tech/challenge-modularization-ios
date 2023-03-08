import Foundation
import Swinject
import SwinjectAutoregistration

import UserProfileInterface
import UserProfile

public class UserProfileAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.register(String.self) { _ in
            return "Hello DI!!!"
        }
        container.autoregister(UserProfileInterface.self, initializer: UserProfileInitializer.init)
    }
}
