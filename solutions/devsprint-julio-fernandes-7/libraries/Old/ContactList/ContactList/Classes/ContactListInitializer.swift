//
//  ContactListInitializer.swift
//  ContactList
//

import UIKit

public final class ContactListInitializer {
    public class func create(_ controller: UIViewController) -> UIViewController {
        let contactListViewController = ContactListViewController()
        contactListViewController.delegate = controller as? any ContactListViewControllerDelegate
        
        return contactListViewController
    }
}
