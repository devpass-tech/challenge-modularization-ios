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
        let assembler = Assembler(
            [
                UserProfileAssembly()
            ]
        )
        return assembler
    }()

    lazy var controller = assembler.resolver.resolve(UserProfileInterface.self)
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Sample App"
        guard let controller = controller else {
            return
        }
        show(controller.createModule(), sender: self)
    }
}
