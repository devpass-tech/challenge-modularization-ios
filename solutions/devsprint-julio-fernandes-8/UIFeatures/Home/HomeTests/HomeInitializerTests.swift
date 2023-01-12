//
//  HomeInitializerTests.swift
//  HomeTests
//

import XCTest
@testable import Home

final class HomeInitializerTests: XCTestCase {
    
    func test_initializer() {
        let sut = HomeViewController()
        
        sut.loadViewIfNeeded()
        
        XCTAssertTrue(sut.view is HomeView)
                                     
    }
    
}
