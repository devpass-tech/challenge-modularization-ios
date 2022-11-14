//
//  ViewController.swift
//  SampleApp
//

import UIKit
import Swinject
import Components
import ActivityDetails
import ActivityDetailsInterface
import ActivityDetailsAssembly

final class ViewController: UIViewController {
    
    let container = DependencyInjector.container
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Sample App"
        registerDependencies()
        
        let controller = container.forceResolve(ActivityDetailsInterface.self)
        show(controller.createModule(), sender: self)
    }
    
    func registerDependencies() {
        ActivityDetailsAssembly().assemble(container: container)
    }
}
