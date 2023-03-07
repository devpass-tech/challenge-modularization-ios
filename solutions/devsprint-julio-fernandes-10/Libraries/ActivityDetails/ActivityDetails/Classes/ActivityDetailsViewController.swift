//
//  ActivityDetailsViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit
import FinanceService

public final class ActivityDetailsViewController: UIViewController {
    // MARK: - UI Components
    private lazy var activityDetailsView: ActivityDetailsView = {
        let activityDetailsView = ActivityDetailsView()
        activityDetailsView.delegate = self
        return activityDetailsView
    }()

    private let service: FinanceServiceProtocol
    
    // MARK: - Initializers
    public init(_ service: FinanceServiceProtocol = FinanceService()) {
        self.service = MainQueueDecorator(decoratee: service)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    public override func viewDidLoad() {
        fecthActivityDetailsData()
    }
    
    public override func loadView() {
        self.view = activityDetailsView
    }
    
    // MARK: - Methods
    private func fecthActivityDetailsData() {
        service.fetchData(ActivityDetails.self, endpoint: .activityDetails) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let activityDetails):
                self.activityDetailsView.setup(activityDetails)
                
            case .failure(let error):
                self.showAlertController(title: "Ops, algo de errado aconteceu!!!", message:  error.localizedDescription, buttonTitle: "Fechar")
            }
        }
    }
    
    private func showAlertController(title: String, message: String, buttonTitle: String) {
        let alertViewController = UIAlertController(title: title,
                                                    message: message,
                                                    preferredStyle: .alert)
        
        alertViewController.addAction(UIAlertAction(title: buttonTitle, style: .default))
        self.present(alertViewController, animated: true)
    }
}

// MARK: - ActivityDetailsViewDelegate
extension ActivityDetailsViewController: ActivityDetailsViewDelegate {
    func didPressReportButton() {
        showAlertController(title:  "Report an issue", message: "The issue was reported", buttonTitle: "Thanks")
    }
}
