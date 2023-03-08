//
//  UserProfileTests.swift
//  UserProfileTests
//

import XCTest
@testable import UserProfile

final class UserProfileTests: XCTestCase {
    let sut = UserProfileInitializer(localizationString: "test ")
    func test_helloWorld() {
        let result = sut.helloWorld()
        XCTAssertEqual(result, "test Hello World from FrontendModule!!")
    }
}