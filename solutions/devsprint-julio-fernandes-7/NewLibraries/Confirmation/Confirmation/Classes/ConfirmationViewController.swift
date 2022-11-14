//
//  ConfirmationViewController.swift
//  Confirmation
//
//  Created by Alexandre Cardoso on 03/11/22.
//

import UIKit
import ConfirmationInterface

public final class ConfirmationFactory: ConfirmationInterface {
    
    public init() {
    }
    
    public func createModule(amount: String) -> UIViewController {
        return ConfirmationViewController(amount: amount)
    }
        
}


final class ConfirmationViewController: UIViewController {

    private lazy var confirmationView: ConfirmationView = {
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
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = confirmationView
    }
}

extension ConfirmationViewController: ConfirmationViewDelegate {

    func didPressConfirmationButton() {
        dismiss(animated: true)
    }
}
