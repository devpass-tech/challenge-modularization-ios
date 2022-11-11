import Foundation
import Swinject
import SwinjectAutoregistration

import ContactListInterface
import ContactList

public class ContactListAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.autoregister(ContactListInterface.self, initializer: ContactListFactory.init)
    }
}
