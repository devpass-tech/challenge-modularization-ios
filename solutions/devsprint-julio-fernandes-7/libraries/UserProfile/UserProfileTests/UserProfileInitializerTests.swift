//
//  UserProfileInitializerTests.swift
//  UserProfileTests
//

import XCTest
@testable import UserProfile

final class UserProfileInitializerTests: XCTestCase {
    
    func testHellorWorld() {
        XCTAssertEqual(UserProfileInitializer.helloWorld(), "Hello World from SDK!!")
    }
    
}