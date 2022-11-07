//
//  FinanceFoundationsInitializerTests.swift
//  FinanceFoundationsTests
//

import XCTest
@testable import FinanceFoundations

final class FinanceFoundationsInitializerTests: XCTestCase {
    
    func testHellorWorld() {
        XCTAssertEqual(FinanceFoundationsInitializer.helloWorld(), "Hello World from SDK!!")
    }
    
}