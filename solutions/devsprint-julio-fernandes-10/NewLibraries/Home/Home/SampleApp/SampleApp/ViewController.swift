//
//  ViewController.swift
//  SampleApp
//

import UIKit
import Swinject
import Home
import HomeInterface
import HomeAssembly

// MOCKS
import FinanceService
import ActivityDetailsAssembly
import UserProfileInterface

final class ViewController: UIViewController {

    var assembler: Assembler = {
        let assembler = Assembler(
            [
                MocksAssembly(),
                ActivityDetailsAssembly(),
                HomeAssembly()
            ]
        )
        return assembler
    }()

    lazy var service = assembler.resolver.resolve(HomeInterface.self)
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Sample App"
        
        guard let controller = service?.make() else { return }
        show(controller, sender: self)
    }
}

private final class MocksAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.autoregister(FinanceServiceProtocol.self, initializer: FinanceService.init)
        container.autoregister(UserProfileInterface.self, initializer: Mocks.init)
    }

}

private final class Mocks: UserProfileInterface {
    func make() -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = .red
        return controller
    }
}
