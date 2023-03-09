//
//  ViewController.swift
//  SampleApp
//

import UIKit
import Swinject
import Home
import HomeInterface
import HomeAssembly

final class ViewController: UIViewController {

    var assembler: Assembler = {
        let assembler = Assembler(
            [
                HomeAssembly()
            ]
        )
        return assembler
    }()

    lazy var service = assembler.resolver.resolve(HomeInterface.self)
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Sample App"
        
        let alert = UIAlertController(title: "Home", message: "Home - Sample App", preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
