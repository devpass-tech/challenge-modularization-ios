//
//  TransfersViewControllerTests.swift
//  TransfersTests
//
//  Created by Pedro Henrique Martins Barbosa on 07/01/23.
//

import XCTest
@testable import Transfers

final class TransfersViewControllerTests: XCTestCase {
    var sut: TransfersViewController?

    override func setUp() {
        super.setUp()
        sut = TransfersViewController()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testIsTransfersView() {
        XCTAssertTrue(sut?.view is TransfersView)
    }
}
