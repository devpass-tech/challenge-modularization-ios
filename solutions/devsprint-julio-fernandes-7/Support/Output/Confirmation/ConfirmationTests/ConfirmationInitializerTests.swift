//
//  ConfirmationInitializerTests.swift
//  ConfirmationTests
//

import XCTest
@testable import Confirmation

final class ConfirmationInitializerTests: XCTestCase {
    
    func testHellorWorld() {
        XCTAssertEqual(ConfirmationInitializer.helloWorld(), "Hello World from SDK!!")
    }
    
}