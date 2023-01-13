//
//  TransfersViewControllerTests.swift
//  TransfersTests
//
//  Created by Pedro Henrique Martins Barbosa on 07/01/23.
//

import XCTest
import ContactListInterface
import ConfirmationInterface
@testable import Transfers

final class TransfersViewControllerTests: XCTestCase {

    func testIsTransfersView() {
        let fakeSpy = FakeSpy()
        let sut = TransfersViewController(contactList: fakeSpy, confirmation: fakeSpy)
        XCTAssertTrue(sut.view is TransfersView)
    }
    
}

final class FakeSpy: ConfirmationInterface, ContactListInterface {
    func buildViewController(amount: String) -> UIViewController {
        return UIViewController()
    }
    
    func buildViewController(delegate: ContactListViewControllerDelegate?) -> UIViewController {
        return UIViewController()
    }
}
