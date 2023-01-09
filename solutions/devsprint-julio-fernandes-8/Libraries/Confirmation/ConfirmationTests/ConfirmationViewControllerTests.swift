//
//  ConfirmationViewControllerTests.swift
//  ConfirmationTests
//
//  Created by Pedro Henrique Martins Barbosa on 05/01/23.
//

import XCTest
@testable import Confirmation

final class ConfirmationViewControllerTests: XCTestCase {
    var sut: ConfirmationViewController?
    
    override func setUp() {
        super.setUp()
        sut = ConfirmationViewController(amount: "100")
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testIsConfirmationView() {
        XCTAssertTrue(sut?.view is ConfirmationView)
    }
}
