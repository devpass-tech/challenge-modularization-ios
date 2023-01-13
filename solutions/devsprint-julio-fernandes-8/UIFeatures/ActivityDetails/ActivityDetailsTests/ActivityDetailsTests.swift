//
//  ActivityDetailsTests.swift
//  ActivityDetailsTests
//

import XCTest
@testable import ActivityDetails

final class ActivityDetailsTests: XCTestCase {
    
    func test_initializer() {
        let sut = ActivityDetailsViewController()
        
        sut.loadViewIfNeeded()
        
        XCTAssertTrue(sut.view is ActivityDetailsView)
    }
}
