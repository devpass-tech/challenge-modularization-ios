//
//  ViewController.swift
//  SampleApp
//

import UIKit
import Swinject
import ActivityDetails
import ActivityDetailsInterface
import ActivityDetailsAssembly

final class ViewController: UIViewController {

    var assembler: Assembler = {
        let assembler = Assembler(
            [
                ActivityDetailsAssembly()
            ]
        )
        return assembler
    }()

    lazy var service = assembler.resolver.resolve(ActivityDetailsInterface.self)
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Sample App"
        
        guard let controller = service?.make() else { return }
        show(controller, sender: self)
    }
}
