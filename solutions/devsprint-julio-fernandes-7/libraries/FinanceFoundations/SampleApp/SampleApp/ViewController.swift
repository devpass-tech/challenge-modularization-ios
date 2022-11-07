//
//  ViewController.swift
//  SampleApp
//

import UIKit
import FinanceFoundations

final class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        title = "Sample App"
        
        let alert = UIAlertController(title: "FinanceFoundations", message: FinanceFoundationsInitializer.helloWorld(), preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}