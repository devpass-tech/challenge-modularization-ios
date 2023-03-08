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
    
    public func make() -> UIViewController {
        return UserProfileViewController()
    }
    
}

final class UserProfileViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = UserProfileView()
    }
}
