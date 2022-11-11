//
//  ViewController.swift
//  SampleApp
//

import UIKit
import Swinject
import ContactList
import ContactListInterface
import ContactListAssembly
import Components

final class ViewController: UIViewController {

    private let container = DependencyInjector.container
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Sample App"
        
        registerDependencies()
        
        let factory = container.forceResolve(ContactListInterface.self)
        let controller = factory.createModule(delegate: ContactListViewControllerDelegateFake())
        show(controller, sender: self)
    }
    
    // MARK: - Private Methods
    
    private func registerDependencies() {
        ContactListAssembly().assemble(container: container)
    }
}

final class ContactListViewControllerDelegateFake: ContactListViewControllerDelegate {
    func didSelectContact() { }
}
