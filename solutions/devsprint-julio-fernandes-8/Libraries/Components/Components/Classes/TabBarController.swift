//
//  TabBarController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/01/22.
//

import UIKit

public class TabBarController: UITabBarController {
    
    public init(viewController: UIViewController, title: String, nameIcon: String, tag: Int) {
        super.init(nibName: nil, bundle: nil)
        let homeNavigationController = UINavigationController(rootViewController: viewController)
        let homeTabBar = UITabBarItem(title: title, image: UIImage(named: nameIcon), tag: tag)
        homeNavigationController.tabBarItem = homeTabBar
        self.viewControllers = [homeNavigationController]
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func addTabBar(viewController: UIViewController, title: String, nameIcon: String, tag: Int) {
        let homeNavigationController = UINavigationController(rootViewController: viewController)
        let homeTabBar = UITabBarItem(title: title, image: UIImage(named: nameIcon), tag: tag)
        homeNavigationController.tabBarItem = homeTabBar

        self.viewControllers?.append(homeNavigationController)
    }
}
