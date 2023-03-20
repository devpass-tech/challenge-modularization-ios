//
//  SceneDelegate.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit
import Components
import HomeInterface
import TransfersInterface

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let home = DependencieInjector.shared.resolve(HomeInterface.self)
        let transfer = DependencieInjector.shared.resolve(TransfersInterface.self)
        
        let homeItem = UITabBarItem(title: "Home", image: UIImage(named: "house.fill"), tag: 0)
        let transfersItem = UITabBarItem(title: "Transfers", image: UIImage(named: "arrow.up.arrow.down"), tag: 1)
        
        let tabBar = TabBarController(viewController: home.make(), tabBarItem: homeItem)
        tabBar.addTabBar(viewController: transfer.make(), tabBarItem: transfersItem)

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: tabBar)
        self.window?.windowScene = windowScene
        self.window?.makeKeyAndVisible()
    }
}
