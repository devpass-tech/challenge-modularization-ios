//
//  ViewController.swift
//  SampleApp
//

import UIKit
import Swinject
import Confirmation
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
        
        guard let controller = service?.make(amount: "R$ 100.000,00") else { return }
        show(controller, sender: self)
    }
}
