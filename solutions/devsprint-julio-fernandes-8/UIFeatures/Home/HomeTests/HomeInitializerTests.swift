//
//  HomeInitializerTests.swift
//  HomeTests
//

import XCTest
import ActivityDetailsInterface
import UserProfileInterface
@testable import Home

final class HomeInitializerTests: XCTestCase {
    
    func test_initializer() {
        let (sut, _) = makeSUT()
        
        sut.loadViewIfNeeded()
        
        XCTAssertTrue(sut.view is HomeView)
                                     
    }
    
    func test_initializer_with_coder() {
        let sut = HomeViewController(coder: NSCoder())
        XCTAssertNil(sut)
                                     
    }
    
    func test_didTap_openProfile() {
        let (sut, fakeSpy) = makeSUT()
        
        sut.openProfile()
        
        XCTAssertTrue(fakeSpy.buildViewControllerCalled)
    }
    
    func test_didTap_didSelectActivity() {
        let (sut, fakeSpy) = makeSUT()
        
        sut.didSelectActivity()
        
        XCTAssertTrue(fakeSpy.buildViewControllerCalled)
    }
    
    private func makeSUT() -> (sut: HomeViewController, spy: FaceInterfaceSpy) {
        let fakeSpy = FaceInterfaceSpy()
        let sut = HomeViewController(userProfile: fakeSpy, activityDetails: fakeSpy)
        
        return (sut, fakeSpy)
    }
    
}

private final class FaceInterfaceSpy: UserProfileInterface, ActivityDetailsInterface {
    
    private(set) var buildViewControllerCalled = false
    
    func buildViewController() -> UIViewController {
        buildViewControllerCalled = true
        return UIViewController()
    }
}
