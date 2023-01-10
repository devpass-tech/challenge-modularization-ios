//
//  ViewController.swift
//  SampleApp
//

import UIKit
import Swinject
import Feature1
import Feature1Interface
import Feature1Assembly

final class ViewController: UIViewController {

    var assembler: Assembler = {
        let assembler = Assembler(
            [
                Feature1Assembly()
            ]
        )
        return assembler
    }()

    lazy var service = assembler.resolver.resolve(Feature1Interface.self)
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Sample App"
        
        let alert = UIAlertController(title: "Feature1", message: service?.helloWorld(), preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}