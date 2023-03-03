//
//  ActivityDetailsInitializerTests.swift
//  ActivityDetailsTests
//

import XCTest
@testable import ActivityDetails

final class ActivityDetailsInitializerTests: XCTestCase {
    
    func testHellorWorld() {
        XCTAssertEqual(ActivityDetailsInitializer.helloWorld(), "Hello World from SDK!!")
    }
    
}