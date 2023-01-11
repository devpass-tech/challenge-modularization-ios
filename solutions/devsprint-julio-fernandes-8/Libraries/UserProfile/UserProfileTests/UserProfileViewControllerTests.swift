//
//  UserProfileViewControllerTests.swift
//  UserProfileTests
//
//  Created by Pedro Henrique Martins Barbosa on 08/01/23.
//

import XCTest
@testable import UserProfile

final class UserProfileViewControllerTests: XCTestCase {
    var sut: UserProfileViewController?

    override func setUp() {
        super.setUp()
        sut = UserProfileViewController()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testIsUserProfileView() {
        XCTAssertTrue(sut?.view is UserProfileView)
    }
}
