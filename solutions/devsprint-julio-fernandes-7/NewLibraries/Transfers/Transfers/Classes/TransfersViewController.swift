//
//  TransfersViewController.swift
//  Transfers
//
//  Created by Gustavo Fernandes on 08/11/22.
//

import UIKit
import Components
import TransfersInterface
import ContactListInterface
import ConfirmationInterface

public final class TransfersFactory: TransfersInterface {
    
    private let container: DependencyInjectorInterface
    public init(container: DependencyInjectorInterface) {
        self.container = container
    }
    
    public func createModule() -> UIViewController {
        return TransfersViewController(container: container)
    }
        
}

final class TransfersViewController: UIViewController {
    
    lazy var transferView: TransfersView = {
        let transferView = TransfersView()
        transferView.delegate = self
        return transferView
    }()
    
    override func loadView() {
        self.view = transferView
    }
    
    private let container: DependencyInjectorInterface
    init(container: DependencyInjectorInterface) {
        self.container = container
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TransfersViewController: TransferViewDelegate {
    
    func didPressChooseContactButton() {
        let controller = container.forceResolve(ContactListInterface.self)
        let navigationController = UINavigationController(rootViewController: controller.createModule(delegate: self))
        present(navigationController, animated: true)
    }
    
    func didPressTransferButton(with amount: String) {
        let controller = container.forceResolve(ConfirmationInterface.self)
        let navigationController = UINavigationController(rootViewController: controller.createModule(amount: amount))
        present(navigationController, animated: true)
    }
}

extension TransfersViewController: ContactListViewControllerDelegate {
    
    func didSelectContact() {
        dismiss(animated: true)
        let alertViewController = UIAlertController(title: "Contact selection", message: "A contact was selected", preferredStyle: .alert)
        let action = UIAlertAction(title: "Thanks", style: .default)
        alertViewController.addAction(action)
        present(alertViewController, animated: true)
    }
}
