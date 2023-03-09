//
//  ViewController.swift
//  SampleApp
//

import UIKit
import Swinject
import ContactListInterface
import ContactListAssembly

final class ViewController: UIViewController, ContactListViewControllerDelegate {
    var assembler: Assembler = {
        let assembler = Assembler(
            [
                ContactListAssembly()
            ]
        )
        return assembler
    }()

    lazy var service = assembler.resolver.resolve(ContactListInterface.self)
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Sample App"
        
        guard let service = service else { return }
        show(service.make(delegate: self), sender: self)
    }
    
    func didSelectContact() {
        print(#function)
    }
}
