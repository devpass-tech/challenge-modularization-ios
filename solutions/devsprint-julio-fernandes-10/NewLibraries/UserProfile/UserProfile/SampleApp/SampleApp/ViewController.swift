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

    lazy var service = assembler.resolver.resolve(UserProfileInterface.self)
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Sample App"
        
        let alert = UIAlertController(title: "UserProfile", message: service?.helloWorld(), preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}