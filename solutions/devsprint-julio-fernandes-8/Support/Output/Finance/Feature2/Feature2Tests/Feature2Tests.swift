//
//  Feature2Tests.swift
//  Feature2Tests
//

import XCTest
@testable import Feature2

final class Feature2Tests: XCTestCase {
    let sut = Feature2Initializer(localizationString: "test ")
    func test_helloWorld() {
        let result = sut.helloWorld()
        XCTAssertEqual(result, "test Hello World from FrontendModule!!")
    }
}