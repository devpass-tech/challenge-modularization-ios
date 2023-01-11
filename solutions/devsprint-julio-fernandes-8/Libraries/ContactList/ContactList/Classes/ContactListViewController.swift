//
//  ContactListViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit

public protocol ContactListViewControllerDelegate: AnyObject {
    func didSelectContact()
}

public class ContactListViewController: UIViewController {

    public weak var delegate: ContactListViewControllerDelegate?

    lazy var contactListView: ContactListView = {

        let contactListView = ContactListView()
        contactListView.delegate = self
        return contactListView
    }()

    public override func loadView() {
        super.loadView()
        self.view = contactListView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contact List"
    }
}

extension ContactListViewController: ContactListViewDelegate {

    func didSelectContact() {
        delegate?.didSelectContact()
    }
}
