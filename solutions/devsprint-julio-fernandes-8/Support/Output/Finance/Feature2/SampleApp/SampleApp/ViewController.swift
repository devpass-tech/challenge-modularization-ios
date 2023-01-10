//
//  ViewController.swift
//  SampleApp
//

import UIKit
import Swinject
import Feature2
import Feature2Interface
import Feature2Assembly

final class ViewController: UIViewController {

    var assembler: Assembler = {
        let assembler = Assembler(
            [
                Feature2Assembly()
            ]
        )
        return assembler
    }()

    lazy var service = assembler.resolver.resolve(Feature2Interface.self)
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Sample App"
        
        let alert = UIAlertController(title: "Feature2", message: service?.helloWorld(), preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}