//
//  ViewController.swift
//  SampleApp
//

import UIKit
import Swinject
import Home
import HomeInterface
import HomeAssembly
import UserProfileInterface
import Components

final class ViewController: UIViewController {
    
    let container = DependencyInjector.container
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Sample App"
        registerDependencies()
        
        guard let controller = container.resolve(HomeInterface.self) else {
            return
        }
        show(controller.createModule(), sender: self)
    }
    
    func registerDependencies() {
        HomeAssembly().assemble(container: container)
        UserProfileFakeAssembly().assemble(container: container)
    }
}

final class UserProfileFakeAssembly: Assembly {
    
    init() {}
    
    func assemble(container: Container) {
        
        container.register(DependencyInjectorInterface.self) { _ in
            DependencyInjector.container
        }
        
        container.autoregister(UserProfileInterface.self, initializer: UserProfileFake.init)
    }
}

final class UserProfileFake: UserProfileInterface {
    func createModule() -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = .red
        return controller
    }
}
