//
//  FinanceServiceInitializerTests.swift
//  FinanceServiceTests
//

import XCTest
@testable import FinanceService

final class FinanceServiceInitializerTests: XCTestCase {
    
    func testHellorWorld() {
        XCTAssertEqual(FinanceServiceInitializer.helloWorld(), "Hello World from SDK!!")
    }
}
