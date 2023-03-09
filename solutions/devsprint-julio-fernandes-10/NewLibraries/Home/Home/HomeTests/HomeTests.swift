//
//  HomeTests.swift
//  HomeTests
//

import XCTest
@testable import Home

final class HomeTests: XCTestCase {
    let sut = HomeInitializer(localizationString: "test ")
    func test_helloWorld() {
        let result = sut.helloWorld()
        XCTAssertEqual(result, "test Hello World from FrontendModule!!")
    }
}