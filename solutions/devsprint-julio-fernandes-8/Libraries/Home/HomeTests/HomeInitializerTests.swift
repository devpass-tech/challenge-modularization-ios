//
//  HomeInitializerTests.swift
//  HomeTests
//

import XCTest
@testable import Home

final class HomeInitializerTests: XCTestCase {
    
    func testHellorWorld() {
        XCTAssertEqual(HomeInitializer.helloWorld(), "Hello World from SDK!!")
    }
    
}