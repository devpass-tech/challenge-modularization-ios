//
//  ViewController.swift
//  SampleApp
//

import UIKit
import Transfers
import Components
import ContactListInterface
import Swinject

final class ViewController: UIViewController {
    
    private let container = DependencyInjector.container
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        title = "Sample App"
        
        register()
        
        let controller = TransfersViewController(container: container)
        show(controller, sender: self)
    }
    
    // MARK: - Private Methods
    
    private func register() {
        ContactListAssembly().assemble(container: container)
    }
    
}

final class ContactListAssembly: Assembly {
    init() { }
    
    func assemble(container: Container) {
        container.register(ContactListInterface.self) { _ in
            ContactListFactoryFake()
        }
    }
}

final class ContactListFactoryFake: ContactListInterface {
    func createModule(delegate: ContactListViewControllerDelegate) -> UIViewController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .blue
        return viewController
    }
}
