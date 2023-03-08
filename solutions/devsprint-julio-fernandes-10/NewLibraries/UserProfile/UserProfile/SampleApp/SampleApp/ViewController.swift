//
//  ViewController.swift
//  SampleApp
//

import UIKit
import Swinject
import UserProfile
import UserProfileInterface
import UserProfileAssembly

final class ViewController: UIViewController {

    var assembler: Assembler = {
        let userProfileAssembly = UserProfileAssembly()
        return Assembler([userProfileAssembly])
    }()

    lazy var service = assembler.resolver.resolve(UserProfileInterface.self)
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "User Profile - Sample App"
        
        guard let service = service else { return }
        show(service.make(), sender: self)
    }
}
