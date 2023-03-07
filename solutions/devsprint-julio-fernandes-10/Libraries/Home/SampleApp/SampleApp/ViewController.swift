//
//  ViewController.swift
//  SampleApp
//

import UIKit
import Home

final class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        title = "Sample App"
        
        let controller = HomeViewController()
        show(controller, sender: self)
    }
    
}
