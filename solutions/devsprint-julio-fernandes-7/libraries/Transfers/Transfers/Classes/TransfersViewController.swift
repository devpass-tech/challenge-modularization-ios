//
//  TransfersViewController.swift
//  Transfers
//
//  Created by Gustavo Fernandes on 08/11/22.
//

import UIKit
import ContactListInterface
import Confirmation
import Components

public class TransfersViewController: UIViewController {
    
    lazy var transferView: TransfersView = {
        let transferView = TransfersView()
        transferView.delegate = self
        return transferView
    }()
    
    private let container: DependencyInjectorInterface
    
    public init(container: DependencyInjectorInterface) {
        self.container = container
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        self.view = transferView
    }
}

extension TransfersViewController: TransferViewDelegate {
    
    func didPressChooseContactButton() {
        let factory = container.forceResolve(ContactListInterface.self)
        let contactListViewController = factory.createModule(delegate: self)
        let navigationController = UINavigationController(rootViewController: contactListViewController)
        self.present(navigationController, animated: true)
    }
    
    func didPressTransferButton(with amount: String) {
        
        let confirmationViewController = ConfirmationViewController(amount: amount)
        let navigationController = UINavigationController(rootViewController: confirmationViewController)
        self.present(navigationController, animated: true)
    }
}

extension TransfersViewController: ContactListViewControllerDelegate {
    
    public func didSelectContact() {
        
        self.dismiss(animated: true)
        
        let alertViewController = UIAlertController(title: "Contact selection", message: "A contact was selected", preferredStyle: .alert)
        let action = UIAlertAction(title: "Thanks", style: .default)
        alertViewController.addAction(action)
        self.present(alertViewController, animated: true)
    }
}
