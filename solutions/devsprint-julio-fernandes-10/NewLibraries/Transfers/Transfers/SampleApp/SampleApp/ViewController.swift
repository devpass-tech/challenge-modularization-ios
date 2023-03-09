//
//  ViewController.swift
//  SampleApp
//

import UIKit
import Swinject
import Transfers
import TransfersInterface
import TransfersAssembly

final class ViewController: UIViewController {

    var assembler: Assembler = {
        let assembler = Assembler(
            [
                TransfersAssembly()
            ]
        )
        return assembler
    }()

    lazy var service = assembler.resolver.resolve(TransfersInterface.self)
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Sample App"
        
        let alert = UIAlertController(title: "Transfers", message: service?.helloWorld(), preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}