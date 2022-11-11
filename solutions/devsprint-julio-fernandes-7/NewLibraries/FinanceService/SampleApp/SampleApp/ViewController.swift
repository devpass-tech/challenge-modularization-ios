//
//  ViewController.swift
//  SampleApp
//

import UIKit
import Swinject
import FinanceService
import FinanceServiceInterface
import FinanceServiceAssembly

final class ViewController: UIViewController {

    var assembler: Assembler = {
        let assembler = Assembler(
            [
                FinanceServiceAssembly()
            ]
        )
        return assembler
    }()

    lazy var service = assembler.resolver.resolve(FinanceServiceInterface.self)
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Sample App"
        
        let alert = UIAlertController(title: "FinanceService", message: service?.helloWorld(), preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}