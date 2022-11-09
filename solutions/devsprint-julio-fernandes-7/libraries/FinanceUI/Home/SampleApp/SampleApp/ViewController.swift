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

    lazy var controller = assembler.resolver.resolve(HomeInterface.self)
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Sample App"
        
        guard let controller = controller?.createModule() else {
            return
        }
        show(controller, sender: self)
    }
}
