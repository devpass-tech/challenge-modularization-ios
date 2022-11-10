//
//  SceneDelegate.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit
import Components
import Transfers

import Swinject
import HomeInterface
import HomeAssembly
import UserProfileAssembly

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private let container = DependencyInjector.container

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        registerDependencies()
        startScene(windowScene: windowScene)
    }
    
    func startScene(windowScene: UIWindowScene) {
        let controller = container.forceResolve(HomeInterface.self)
        let tabBar = TabBarController(viewController: controller.createModule(), title: "Home", nameIcon: "house.fill", tag: 0)
        tabBar.addTabBar(viewController: TransfersViewController(), title: "Trans", nameIcon: "arrow.up.arrow.down", tag: 1)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: tabBar)
        self.window?.windowScene = windowScene
        self.window?.makeKeyAndVisible()
    }
    
    private func registerDependencies() {
        DependencyInjectorAssembly().assemble(container: container)
        HomeAssembly().assemble(container: container)
        UserProfileAssembly().assemble(container: container)
    }
}

public class DependencyInjectorAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.register(DependencyInjectorInterface.self) { _ in
            DependencyInjector.container
        }
    }
}
