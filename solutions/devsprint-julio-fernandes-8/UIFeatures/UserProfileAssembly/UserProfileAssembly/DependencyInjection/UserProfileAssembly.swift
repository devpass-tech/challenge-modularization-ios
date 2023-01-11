import Foundation
import Swinject
import SwinjectAutoregistration

import UserProfileInterface
import UserProfile

public class UserProfileAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.autoregister(UserProfileInterface.self, initializer: UserProfileFactory.init)
    }
}
