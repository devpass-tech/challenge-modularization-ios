//
//  GlobalDependencyInjector.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 10/11/22.
//

import Swinject
import Components
import HomeAssembly
import UserProfileAssembly
import ActivityDetailsAssembly
import TransfersAssembly
import ConfirmationAssembly
import ContactListAssembly

final class GlobalDependencyInjector {
    
    static func registerDependencies() {
        let container = DependencyInjector.container
        DependencyInjectorAssembly().assemble(container: container)
        HomeAssembly().assemble(container: container)
        UserProfileAssembly().assemble(container: container)
        ActivityDetailsAssembly().assemble(container: container)
        TransfersAssembly().assemble(container: container)
        ConfirmationAssembly().assemble(container: container)
        ContactListAssembly().assemble(container: container)
    }
}


public class DependencyInjectorAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.register(DependencyInjectorInterface.self) { _ in
            DependencyInjector.container
        }
    }
}
