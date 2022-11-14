//
//  ViewController.swift
//  SampleApp
//

import UIKit
import Swinject
import Components
import TransfersInterface
import ContactListInterface
import ConfirmationInterface
import TransfersAssembly

final class ViewController: UIViewController {

    let container = DependencyInjector.container

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Sample App"
        registerDependencies()
        
        let controller = container.forceResolve(TransfersInterface.self)
        show(controller.createModule(), sender: self)
    }
    
    func registerDependencies() {
        TransfersAssembly().assemble(container: container)
        FakeAssembly().assemble(container: container)
    }
}

final class FakeAssembly: Assembly {
    func assemble(container: Container) {
        container.register(DependencyInjectorInterface.self) { _ in DependencyInjector.container }
        container.autoregister(ContactListInterface.self, initializer: Fakes.init)
        container.autoregister(ConfirmationInterface.self, initializer: Fakes.init)
    }
}

final class Fakes: ContactListInterface, ConfirmationInterface {
    func createModule(amount: String) -> UIViewController {
        return createModule(delegate: nil)
    }
    
    func createModule(delegate: ContactListViewControllerDelegate?) -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = .red
        return controller
    }
}
