//
//  TabBarController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/01/22.
//

import UIKit

public final class TabBarController: UITabBarController {
    public init(viewController: UIViewController, tabBarItem: UITabBarItem) {
        super.init(nibName: nil, bundle: nil)
        let navigationController = getNavigationController(viewController, tabBarItem: tabBarItem)
        self.viewControllers = [navigationController]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func addTabBar(viewController: UIViewController, tabBarItem: UITabBarItem) {
        let navigationController = getNavigationController(viewController, tabBarItem: tabBarItem)
        self.viewControllers?.append(navigationController)
    }
    
    private func getNavigationController(_ viewController: UIViewController, tabBarItem: UITabBarItem) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = tabBarItem
        return navigationController
    }
}
