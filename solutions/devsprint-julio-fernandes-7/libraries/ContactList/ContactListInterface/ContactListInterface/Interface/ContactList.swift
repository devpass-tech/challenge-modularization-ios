//
//  ContactListInterface.swift
//  ContactListInterface
//

import Foundation

public protocol ContactListViewControllerDelegate: AnyObject {
    func didSelectContact()
}

public protocol ContactListInterface {
    func createModule(delegate: ContactListViewControllerDelegate) -> UIViewController
}
