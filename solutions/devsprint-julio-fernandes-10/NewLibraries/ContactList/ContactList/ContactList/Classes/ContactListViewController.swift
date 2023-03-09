//
//  ContactListViewController.swift
//  FinanceApp
//
//  Created by Rodrigo Borges on 30/12/21.
//

import UIKit
import ContactListInterface

public class ContactListFactory: ContactListInterface {
    public init() {}
    
    public func make() -> UIViewController {
        return ContactListViewController()
    }

}

protocol ContactListViewControllerDelegate: AnyObject {
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
        super.loadView()
        self.view = contactListView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Contact List"
    }
}

extension ContactListViewController: ContactListViewDelegate {

    func didSelectContact() {
        delegate?.didSelectContact()
    }
}
