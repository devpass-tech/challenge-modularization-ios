//
//  ContactListInterface.swift
//  ContactListInterface
//

import UIKit

public protocol ContactListInterface {
    func make(delegate: ContactListViewControllerDelegate?) -> UIViewController
}

public protocol ContactListViewControllerDelegate: AnyObject {
    func didSelectContact()
}
