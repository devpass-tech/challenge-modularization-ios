//
//  ContactListInterface.swift
//  ContactListInterface
//

import Foundation

public protocol ContactListInterface {
    func buildViewController(delegate: ContactListViewControllerDelegate?) -> UIViewController
}

public protocol ContactListViewControllerDelegate: AnyObject {
    func didSelectContact()
}
