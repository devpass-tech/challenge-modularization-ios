//
//  TransfersViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit
import ConfirmationInterface
import ContactListInterface
import TransfersInterface

public class TransfersFactory: TransfersInterface {
    private let contactList: ContactListInterface
    private let confirmation: ConfirmationInterface
    
    public init(contactList: ContactListInterface, confirmation: ConfirmationInterface) {
        self.contactList = contactList
        self.confirmation = confirmation
    }
    
    public func make() -> UIViewController {
        let controller = TransfersViewController(contactList: contactList, confirmation: confirmation)
        return controller
    }
}

final class TransfersViewController: UIViewController {

    lazy var transferView: TransfersView = {

        let transferView = TransfersView()
        transferView.delegate = self
        return transferView
    }()

    override func loadView() {
        super.loadView()
        self.view = transferView
    }
    
    private let contactList: ContactListInterface
    private let confirmation: ConfirmationInterface
    
    init(contactList: ContactListInterface, confirmation: ConfirmationInterface) {
        self.contactList = contactList
        self.confirmation = confirmation
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TransfersViewController: TransferViewDelegate {

    func didPressChooseContactButton() {
        let contactListViewController = contactList.make(delegate: self)
        let navigationController = UINavigationController(rootViewController: contactListViewController)
        self.present(navigationController, animated: true)
    }

    func didPressTransferButton(with amount: String) {
        let confirmationViewController = confirmation.make(amount: amount)
        let navigationController = UINavigationController(rootViewController: confirmationViewController)
        self.present(navigationController, animated: true)
    }
}

extension TransfersViewController: ContactListViewControllerDelegate {

    func didSelectContact() {
        self.dismiss(animated: true)

        let alertViewController = UIAlertController(title: "Contact selection", message: "A contact was selected", preferredStyle: .alert)
        let action = UIAlertAction(title: "Thanks", style: .default)
        alertViewController.addAction(action)
        self.present(alertViewController, animated: true)
    }
}
