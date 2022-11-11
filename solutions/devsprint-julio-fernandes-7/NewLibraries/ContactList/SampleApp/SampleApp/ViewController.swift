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

    let container = DependencyInjector.container

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Sample App"
        registerDependencies()
        
        let controller = container.forceResolve(ContactListInterface.self)
        show(controller.createModule(delegate: self), sender: self)
    }
    
    func registerDependencies() {
        ContactListAssembly().assemble(container: container)
    }
}

extension ViewController: ContactListViewControllerDelegate {
    func didSelectContact() {
        let alert = UIAlertController(title: "Transfers", message: "didSelectContact", preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
