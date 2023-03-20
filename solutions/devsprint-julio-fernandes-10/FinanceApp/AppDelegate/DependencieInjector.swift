//
//  DependencieInjector.swift
//  FinanceApp
//
//  Created by Julio Fernandes on 09/03/23.
//

import Foundation
import Swinject
import SwinjectAutoregistration
import ActivityDetailsAssembly
import ConfirmationAssembly
import ContactListAssembly
import HomeAssembly
import TransfersAssembly
import UserProfileAssembly
import FinanceService

final class DependencieInjector {
    private init() {}
    static let shared = DependencieInjector()
    
    private var assembler: Assembler = {
        return Assembler([
            ActivityDetailsAssembly(),
            ConfirmationAssembly(),
            ContactListAssembly(),
            HomeAssembly(),
            TransfersAssembly(),
            UserProfileAssembly(),
            FinanceServiceAssembly()
        ])
    }()
    
    func resolve<Service>(_ serviceType: Service.Type) -> Service {
        guard let service = assembler.resolver.resolve(serviceType) else {
            fatalError("\(serviceType) is not registred")
        }
        
        return service
    }
}

private class FinanceServiceAssembly: Assembly {
    init() {}
    func assemble(container: Container) {
        container.autoregister(FinanceServiceProtocol.self, initializer: FinanceService.init)
    }
}
