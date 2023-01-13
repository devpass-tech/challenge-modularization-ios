//
//  AppDelegate.swift
//  SampleApp
//

import UIKit
import Swinject
import TransfersInterface
import TransfersAssembly
import ConfirmationInterface
import ContactListInterface

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var assembler: Assembler = {
        let assembler = Assembler(
            [
                FakeAssembly(),
                TransfersAssembly()
            ]
        )
        return assembler
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
        let factory = assembler.resolver.resolve(TransfersInterface.self)
        let controller = factory?.buildViewController() ?? UIViewController()
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        window.makeKeyAndVisible()
        window.rootViewController = UINavigationController(rootViewController: controller)
        self.window = window
        
        return true
    }
}

public class FakeAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.autoregister(ConfirmationInterface.self, initializer: FakeSpy.init)
        container.autoregister(ContactListInterface.self, initializer: FakeSpy.init)
    }
}



final class FakeSpy: ConfirmationInterface, ContactListInterface {
    func buildViewController(amount: String) -> UIViewController {
        return makeVC()
    }
    
    func buildViewController(delegate: ContactListViewControllerDelegate?) -> UIViewController {
        return makeVC()
    }
    
    private func makeVC() -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = .red
        return controller
    }
}
