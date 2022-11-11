//
//  FinanceServiceTests.swift
//  FinanceServiceTests
//

import XCTest
@testable import FinanceService

final class FinanceServiceTests: XCTestCase {
    let sut = FinanceServiceInitializer(localizationString: "test ")
    func test_helloWorld() {
        let result = sut.helloWorld()
        XCTAssertEqual(result, "test Hello World from FrontendModule!!")
    }
}