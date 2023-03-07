//
//  SceneDelegate.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit
import Components
import Home
import Transfers

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let homeItem = UITabBarItem(title: "Home", image: UIImage(named: "house.fill"), tag: 0)
        let transfersItem = UITabBarItem(title: "Transfers", image: UIImage(named: "arrow.up.arrow.down"), tag: 1)
        
        let tabBar = TabBarController(viewController: HomeViewController(), tabBarItem: homeItem)
        tabBar.addTabBar(viewController: TransfersViewController(), tabBarItem: transfersItem)

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: tabBar)
        self.window?.windowScene = windowScene
        self.window?.makeKeyAndVisible()
    }
}
