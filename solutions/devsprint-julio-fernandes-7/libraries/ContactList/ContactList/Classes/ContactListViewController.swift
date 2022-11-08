//
//  ContactListViewController.swift
//  ContactList
//
//  Created by Cibele Paulino on 08/11/22.
//

import UIKit

public protocol ContactListViewControllerDelegate: AnyObject {

    func didSelectContact()
}

class ContactListViewController: UIViewController {

    weak var delegate: ContactListViewControllerDelegate?

    lazy var contactListView: ContactListView = {

        let contactListView = ContactListView()
        contactListView.delegate = self
        return contactListView
    }()

    override func loadView() {
        self.view = contactListView
    }

    override func viewDidLoad() {
        self.title = Localization.ContactList.title
    }
}

extension ContactListViewController: ContactListViewDelegate {

    func didSelectContact() {

        delegate?.didSelectContact()
    }
}
