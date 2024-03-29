//
//  AppDelegate.swift
//  SampleApp
//

import UIKit
import Swinject
import UserProfileAssembly
import UserProfileInterface

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var assembler: Assembler = {
        return Assembler(
            [
                UserProfileAssembly()
            ]
        )
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let factory = assembler.resolver.resolve(UserProfileInterface.self)
        let controller = factory?.buildViewController() ?? UIViewController()
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        window.makeKeyAndVisible()
        window.rootViewController = UINavigationController(rootViewController: controller)
        self.window = window
        
        return true
    }
}
