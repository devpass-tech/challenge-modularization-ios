//
//  ContactListInitializerTests.swift
//  ContactListTests
//

import XCTest
@testable import ContactList

final class ContactListInitializerTests: XCTestCase {
    
    func test_initializer() {
        let sut = ContactListViewController()
        
        sut.loadViewIfNeeded()
        
        XCTAssertTrue(sut.view is ContactListView)
    }
    
}
