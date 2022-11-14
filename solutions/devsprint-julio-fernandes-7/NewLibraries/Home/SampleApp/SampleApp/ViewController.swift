//
//  ViewController.swift
//  SampleApp
//

import UIKit
import Swinject
import Home
import Components
import HomeAssembly
import FinanceServiceAssembly
import HomeInterface
import UserProfileInterface
import ActivityDetailsInterface

final class ViewController: UIViewController {
    
    let container = DependencyInjector.container
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Sample App"
        registerDependencies()
        
        let controller = container.forceResolve(HomeInterface.self)
        show(controller.createModule(), sender: self)
    }
    
    func registerDependencies() {
        HomeAssembly().assemble(container: container)
        FakeAssembly().assemble(container: container)
        FinanceServiceAssembly().assemble(container: container)
    }
}

final class FakeAssembly: Assembly {
    func assemble(container: Container) {
        container.register(DependencyInjectorInterface.self) { _ in DependencyInjector.container }
        container.autoregister(UserProfileInterface.self, initializer: Fakes.init)
        container.autoregister(ActivityDetailsInterface.self, initializer: Fakes.init)
    }
}

final class Fakes: UserProfileInterface, ActivityDetailsInterface {
    func createModule() -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = .red
        return controller
    }
}
