//
//  ContactListInterface.swift
//  ContactListInterface
//

import Foundation

public protocol ContactListInterface {
    func createModule(delegate: ContactListViewControllerDelegate?) -> UIViewController
}

public protocol ContactListViewControllerDelegate: AnyObject {
    func didSelectContact()
}
