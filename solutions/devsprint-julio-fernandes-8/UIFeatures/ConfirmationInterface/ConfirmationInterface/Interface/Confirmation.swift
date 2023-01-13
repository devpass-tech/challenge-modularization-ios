//
//  ConfirmationInterface.swift
//  ConfirmationInterface
//

import Foundation

public protocol ConfirmationInterface {
    func buildViewController(amount: String) -> UIViewController
}
