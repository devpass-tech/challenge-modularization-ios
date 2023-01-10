//
//  Feature1Tests.swift
//  Feature1Tests
//

import XCTest
@testable import Feature1

final class Feature1Tests: XCTestCase {
    let sut = Feature1Initializer(localizationString: "test ")
    func test_helloWorld() {
        let result = sut.helloWorld()
        XCTAssertEqual(result, "test Hello World from FrontendModule!!")
    }
}