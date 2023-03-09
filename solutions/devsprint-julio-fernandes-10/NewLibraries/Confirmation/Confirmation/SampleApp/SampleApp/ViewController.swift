//
//  ViewController.swift
//  SampleApp
//

import UIKit
import Swinject
import ConfirmationInterface
import ConfirmationAssembly

final class ViewController: UIViewController {

    var assembler: Assembler = {
        let assembler = Assembler(
            [
                ConfirmationAssembly()
            ]
        )
        return assembler
    }()

    lazy var service = assembler.resolver.resolve(ConfirmationInterface.self)
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Sample App"
        
        guard let service = service else { return }
        show(service.make(amount: "1.00"), sender: self)
    }
}
