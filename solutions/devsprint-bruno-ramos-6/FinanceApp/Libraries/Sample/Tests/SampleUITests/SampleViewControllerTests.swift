//
//  File.swift
//  
//
//  Created by Bruno Henrique Costa Ramos on 18/08/22.
//

import Foundation
import UIKit
import XCTest
import Sample

final class SampleViewControllerTests: XCTestCase {
    private let customViewSpy = SampleViewProtocolSpy()
    private let serviceStub = SampleServiceProtocolStub()

    private lazy var sut = SampleViewController(
        customView: customViewSpy,
        service: serviceStub
    )

    func test_viewDidLoad_whenServiceReturnsSuccessWithData_shouldCallDisplayDataWithData() {
        // Given
        let expectedData = ["foo", "bar", "xyz"]
        serviceStub.fetchCompletionToBeReturned = .success(expectedData)

        // When
        sut.viewDidLoad()

        // Then
        XCTAssertTrue(customViewSpy.displayDataCalled)
        XCTAssertEqual(customViewSpy.displayDataDataPassed, expectedData)
        XCTAssertFalse(customViewSpy.displayErrorCalled)
    }

    func test_viewDidLoad_whenServiceReturnsFailureWithError_shouldCallDisplayErrorWithSamePassedError() {
        // Given
        serviceStub.fetchCompletionToBeReturned = .failure(ErrorDummy())

        // When
        sut.viewDidLoad()

        // Then
        XCTAssertTrue(customViewSpy.displayErrorCalled)
        XCTAssertNotNil(customViewSpy.displayDataErrorPassed as? SampleViewControllerServiceError)
        XCTAssertFalse(customViewSpy.displayDataCalled)
    }
}

struct ErrorDummy: Error {}

final class SampleViewProtocolSpy: UIView, SampleViewProtocol {

    private(set) var displayDataCalled = false
    private(set) var displayDataDataPassed: [String] = []

    func display(data: [String]) {
        displayDataCalled = true
        displayDataDataPassed = data
    }

    private(set) var displayErrorCalled = false
    private(set) var displayDataErrorPassed: Error?

    func display(error: Error) {
        displayErrorCalled = true
        displayDataErrorPassed = error
    }
}

final class SampleServiceProtocolStub: SampleServiceProtocol {

    var fetchCompletionToBeReturned: Result<[String], Error>?

    func fetch(completion: @escaping (Result<[String], Error>) -> Void) {
        if let fetchCompletionToBeReturned = fetchCompletionToBeReturned {
            completion(fetchCompletionToBeReturned)
        }
    }
}
