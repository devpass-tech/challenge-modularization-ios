import Foundation
import Swinject
import SwinjectAutoregistration

import ContactListInterface
import ContactList

public class ContactListAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.register(String.self) { _ in
            return "Hello DI!!!"
        }
        container.autoregister(ContactListInterface.self, initializer: ContactListFactory.init)
    }
}
