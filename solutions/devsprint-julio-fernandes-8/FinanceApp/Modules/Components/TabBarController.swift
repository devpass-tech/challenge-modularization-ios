//
//  TabBarController.swift
//  FinanceApp
//
//  Created by Pedro Henrique Martins Barbosa on 09/01/23.
//

import Foundation
import UIKit

public class TabBarController: UITabBarController {
    
    public init(viewController: UIViewController, title: String, nameIcon: String, tag: Int) {
        super.init(nibName: nil, bundle: nil)
        let homeNavigationController = UINavigationController(rootViewController: viewController)
        let homeTabBar = UITabBarItem(title: title, image: UIImage(named: nameIcon), tag: tag)
        homeNavigationController.tabBarItem = homeTabBar
        self.viewControllers = [homeNavigationController]
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        return nil
    }

    public func addTabBar(viewController: UIViewController, title: String, nameIcon: String, tag: Int) {
        let homeNavigationController = UINavigationController(rootViewController: viewController)
        let homeTabBar = UITabBarItem(title: title, image: UIImage(named: nameIcon), tag: tag)
        homeNavigationController.tabBarItem = homeTabBar

        self.viewControllers?.append(homeNavigationController)
    }
}
