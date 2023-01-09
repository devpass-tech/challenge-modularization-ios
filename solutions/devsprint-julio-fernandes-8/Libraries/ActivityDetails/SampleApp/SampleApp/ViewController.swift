//
//  ViewController.swift
//  SampleApp
//

import UIKit
import ActivityDetails

final class ViewController: UIViewController {
    
    let detailsView: ActivityDetailsViewController
    
    public init(detailsView: ActivityDetailsView) {
        self.detailsView = detailsView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        title = "Sample App"
        
       
    }
    
}
