//
//  AppDelegate.swift
//  SampleApp
//

import UIKit
import Swinject
import ConfirmationAssembly
import ConfirmationInterface

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var assembler: Assembler = {
        let assembler = Assembler(
            [
                ConfirmationAssembly()
            ]
        )
        return assembler
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
        let factory = assembler.resolver.resolve(ConfirmationInterface.self)
        let controller = factory?.buildViewController(amount: "U$ 100") ?? UIViewController()
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        window.makeKeyAndVisible()
        window.rootViewController = UINavigationController(rootViewController: controller)
        self.window = window
        
        return true
    }
}
