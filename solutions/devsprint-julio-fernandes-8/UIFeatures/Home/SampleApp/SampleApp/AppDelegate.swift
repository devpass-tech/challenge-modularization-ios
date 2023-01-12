//
//  AppDelegate.swift
//  SampleApp
//

import UIKit
import Swinject
import HomeAssembly
import HomeInterface
import ActivityDetailsInterface
import UserProfileInterface

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var assembler: Assembler = {
        let assembler = Assembler(
            [
                FakeAssembly(),
                HomeAssembly()
            ]
        )
        return assembler
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let factory = assembler.resolver.resolve(HomeInterface.self)
        let controller = factory?.buildViewController() ?? UIViewController()
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        window.makeKeyAndVisible()
        window.rootViewController = UINavigationController(rootViewController: controller)
        self.window = window
        
        return true
    }
}

private final class FaceViewController: UserProfileInterface, ActivityDetailsInterface {
    
    func buildViewController() -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = .red
        return controller
    }
}

public class FakeAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.autoregister(UserProfileInterface.self, initializer: FaceViewController.init)
        container.autoregister(ActivityDetailsInterface.self, initializer: FaceViewController.init)
    }
}
