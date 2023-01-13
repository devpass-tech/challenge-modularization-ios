//
//  AppDelegate.swift
//  SampleApp
//

import UIKit
import Swinject
import ContactListAssembly
import ContactListInterface

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var assembler: Assembler = {
        let assembler = Assembler(
            [
                ContactListAssembly()
            ]
        )
        return assembler
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let factory = assembler.resolver.resolve(ContactListInterface.self)
        let controller = factory?.buildViewController(delegate: nil) ?? UIViewController()
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        window.makeKeyAndVisible()
        window.rootViewController = UINavigationController(rootViewController: controller)
        self.window = window
        
        return true
    }
}
