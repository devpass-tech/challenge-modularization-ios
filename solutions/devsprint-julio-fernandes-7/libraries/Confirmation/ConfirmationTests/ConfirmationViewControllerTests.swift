//
//  ConfirmationViewControllerTests.swift
//  ConfirmationTests
//
//  Created by Alexandre Cardoso on 03/11/22.
//

import XCTest
@testable import Confirmation

final class ConfirmationViewControllerTests: XCTestCase {
    
    var sut: ConfirmationViewController!
    
    override func setUp() {
        super.setUp()
        sut = ConfirmationViewController(amount: "12")
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testView() {
        XCTAssertTrue(sut.view is ConfirmationView)
    }
}
