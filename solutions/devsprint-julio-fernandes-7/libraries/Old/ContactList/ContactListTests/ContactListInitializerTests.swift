//
//  ContactListInitializerTests.swift
//  ContactListTests
//

import XCTest
@testable import ContactList

final class ContactListInitializerTests: XCTestCase {
    
    func testHellorWorld() {
        XCTAssertEqual(ContactListInitializer.helloWorld(), "Hello World from SDK!!")
    }
    
}