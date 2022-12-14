//
//  TabBarController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/01/22.
//

import Transfer
import UIKit
import Home
import UserProfile
import ActivityDetails
import Sample

class TabBarController: UITabBarController {

    override func viewWillAppear(_ animated: Bool) {
        let homeNavigationController = UINavigationController(rootViewController: HomeFactory.make())
        let homeTabBar = UITabBarItem(title: "Home", image: UIImage(named: "house.fill"), tag: 0)
        homeNavigationController.tabBarItem = homeTabBar

        let transfersViewController = TransfersViewController()
        let transfersNavigationController = UINavigationController(rootViewController: transfersViewController)
        let transfersTabBar = UITabBarItem(title: "Transfers", image: UIImage(named: "arrow.up.arrow.down"), tag: 1)
        transfersNavigationController.tabBarItem = transfersTabBar

        self.viewControllers = [homeNavigationController, transfersNavigationController]
    }
}
