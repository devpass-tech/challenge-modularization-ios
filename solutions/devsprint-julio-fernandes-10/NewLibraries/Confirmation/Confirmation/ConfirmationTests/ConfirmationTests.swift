//
//  ConfirmationTests.swift
//  ConfirmationTests
//

import XCTest
@testable import Confirmation

final class ConfirmationTests: XCTestCase {
    let sut = ConfirmationInitializer(localizationString: "test ")
    func test_helloWorld() {
        let result = sut.helloWorld()
        XCTAssertEqual(result, "test Hello World from FrontendModule!!")
    }
}