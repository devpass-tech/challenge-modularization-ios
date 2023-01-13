//
//  ConfirmationViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit
import ConfirmationInterface

public final class ConfirmationFactory: ConfirmationInterface {
    
    public init() {}
    
    public func buildViewController(amount: String) -> UIViewController {
        let controller = ConfirmationViewController(amount: amount)
        return controller
    }
    
}

final class ConfirmationViewController: UIViewController {

    lazy var confirmationView: ConfirmationView = {

        let confirmationView = ConfirmationView()
        confirmationView.delegate = self
        return confirmationView
    }()

    init(amount: String) {
        super.init(nibName: nil, bundle: nil)
        confirmationView.confirmationLabel.text = "Your transfer of $\(amount) was successful 🤑"
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func loadView() {
        self.view = confirmationView
    }
}

extension ConfirmationViewController: ConfirmationViewDelegate {

    func didPressConfirmationButton() {
        self.dismiss(animated: true)
    }
}
