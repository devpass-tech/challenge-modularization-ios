//
//  ContactListTests.swift
//  ContactListTests
//

import XCTest
@testable import ContactList

final class ContactListTests: XCTestCase {
    let sut = ContactListInitializer(localizationString: "test ")
    func test_helloWorld() {
        let result = sut.helloWorld()
        XCTAssertEqual(result, "test Hello World from FrontendModule!!")
    }
}