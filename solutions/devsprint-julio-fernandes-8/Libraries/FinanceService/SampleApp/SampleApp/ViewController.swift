//
//  ViewController.swift
//  SampleApp
//

import UIKit
import FinanceService

final class ViewController: UIViewController {
    
    let service: FinanceService = FinanceService()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Sample App"
        
        service.fetchHomeData { data in
            guard let viewModel = data else {
                return
            }
            print("balance: \(viewModel.balance)")
        }
        
        service.fetchActivityDetails { data in
            guard let viewModel = data else {
                return
            }
            print("name: \(viewModel.name)")
        }
    }
    
}
