//
//  ViewController.swift
//  SampleApp
//

import UIKit
import ActivityDetails

final class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        title = "Sample App"
        
        let alert = UIAlertController(title: "ActivityDetails", message: ActivityDetailsInitializer.helloWorld(), preferredStyle: .alert)
        alert.addAction(.init(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}