//
//  UserProfileViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit
import UserProfileInterface

public final class UserProfileFactory: UserProfileInterface {
    
    public init() {}
    
    public func buildViewController() -> UIViewController {
        return UserProfileViewController()
    }
    
}

final class UserProfileViewController: UIViewController {

    override func loadView() {
        self.view = UserProfileView()
    }
}
