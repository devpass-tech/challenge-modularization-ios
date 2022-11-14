//
//  SceneDelegate.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit
import Swinject
import Components
import TransfersInterface
import HomeInterface

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var container = DependencyInjector.container

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        GlobalDependencyInjector.registerDependencies()
        startScene(windowScene: windowScene)
    }
    
    func startScene(windowScene: UIWindowScene) {
        let home = container.forceResolve(HomeInterface.self)
        let transfers = container.forceResolve(TransfersInterface.self)
        
        let tabBar = TabBarController(viewController: home.createModule(), title: "Home", nameIcon: "house.fill", tag: 0)
        tabBar.addTabBar(viewController: transfers.createModule(), title: "Trans", nameIcon: "arrow.up.arrow.down", tag: 1)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: tabBar)
        self.window?.windowScene = windowScene
        self.window?.makeKeyAndVisible()
    }
    
}

