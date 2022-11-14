//
//  ComponentsInitializerTests.swift
//  ComponentsTests
//

import XCTest
@testable import Components

final class ComponentsInitializerTests: XCTestCase {
    
    func testHellorWorld() {
        XCTAssertEqual(ComponentsInitializer.helloWorld(), "Hello World from SDK!!")
    }
    
}
