//
//  ModuleFactories.swift
//  FinanceApp
//
//  Created by Bruno Henrique Costa Ramos on 17/08/22.
//

import Foundation
import UIKit
import Home
import UserProfile
import ActivityDetails

typealias DependencyFactory = (UIViewController) -> Void

enum ActivityDetailFactory {
    static func make() -> UIViewController {
        ActivityDetailsViewController()
    }
}

let onRouteToActivityDetail: DependencyFactory = { presentedViewController in
    let activityDetailViewController = ActivityDetailFactory.make()
    presentedViewController.navigationController?.pushViewController(activityDetailViewController, animated: true)
}

enum UserProfileFactory {
    static func make() -> UIViewController {
        UserProfileViewController()
    }
}

let onRouteToUserProfile: DependencyFactory = { presentedViewController in
    let userViewController = UserProfileFactory.make()
    presentedViewController.present(userViewController, animated: true, completion: nil)
}
