//
//  TransfersTests.swift
//  TransfersTests
//

import XCTest
@testable import Transfers

final class TransfersTests: XCTestCase {
    let sut = TransfersInitializer(localizationString: "test ")
    func test_helloWorld() {
        let result = sut.helloWorld()
        XCTAssertEqual(result, "test Hello World from FrontendModule!!")
    }
}