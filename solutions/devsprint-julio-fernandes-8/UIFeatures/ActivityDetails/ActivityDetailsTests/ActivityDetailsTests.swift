//
//  ActivityDetailsTests.swift
//  ActivityDetailsTests
//

import XCTest
@testable import ActivityDetails

final class ActivityDetailsTests: XCTestCase {
    let sut = ActivityDetailsInitializer(localizationString: "test ")
    func test_helloWorld() {
        let result = sut.helloWorld()
        XCTAssertEqual(result, "test Hello World from FrontendModule!!")
    }
}