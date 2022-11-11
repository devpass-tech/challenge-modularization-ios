//
//  ViewController.swift
//  SampleApp
//

import UIKit
import Swinject
import Components
import Confirmation
import ConfirmationInterface
import ConfirmationAssembly

final class ViewController: UIViewController {

    let container = DependencyInjector.container

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Sample App"
        registerDependencies()
        
        let controller = container.forceResolve(ConfirmationInterface.self)
        show(controller.createModule(amount: "R$ 1.000.000.000,00"), sender: self)
    }
    
    func registerDependencies() {
        ConfirmationAssembly().assemble(container: container)
    }
}
