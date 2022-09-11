//
//  File.swift
//  
//
//  Created by Bruno Henrique Costa Ramos on 18/08/22.
//

import UIKit
import XCTest
import Sample
import SampleUI
import SampleData
import SampleDomain

final class SampleViewControllerTests: XCTestCase {
    private let customViewSpy = SampleViewProtocolSpy()
    private let serviceStub = SampleServiceProtocolStub()

    private lazy var sut = SampleViewController(
        customView: customViewSpy,
        service: serviceStub
    )

    func test_viewDidLoad_whenServiceReturnsSuccessWithData_shouldCallDisplayDataWithData() {
        // Given
        let expectedData: [Activity] = [
            .init(name: "foo", value: 0.0),
            .init(name: "bar", value: 1.0),
            .init(name: "xyz", value: 1.5)
        ]
        serviceStub.fetchCompletionToBeReturned = .success(expectedData)

        // When
        sut.viewDidLoad()

        // Then
        XCTAssertTrue(customViewSpy.displayDataCalled)
        XCTAssertEqual(customViewSpy.displayDataDataPassed.count, expectedData.count)
        XCTAssertFalse(customViewSpy.displayErrorCalled)
    }

    func test_viewDidLoad_whenServiceReturnsFailureWithError_shouldCallDisplayErrorWithSamePassedError() {
        // Given
        serviceStub.fetchCompletionToBeReturned = .failure(ErrorDummy())

        // When
        sut.viewDidLoad()

        // Then
        XCTAssertTrue(customViewSpy.displayErrorCalled)
        XCTAssertNotNil(customViewSpy.displayDataErrorPassed as? ErrorDummy)
        XCTAssertFalse(customViewSpy.displayDataCalled)
    }
}

struct ErrorDummy: Error {}

final class SampleViewProtocolSpy: UIView, SampleViewProtocol {

    private(set) var displayDataCalled = false
    private(set) var displayDataDataPassed: [SampleView.ViewModel] = []

    func display(viewModel: [SampleView.ViewModel]) {
        displayDataCalled = true
        displayDataDataPassed = viewModel
    }

    private(set) var displayErrorCalled = false
    private(set) var displayDataErrorPassed: Error?

    func display(error: Error) {
        displayErrorCalled = true
        displayDataErrorPassed = error
    }
}

final class SampleServiceProtocolStub: SampleServiceProtocol {

    var fetchCompletionToBeReturned: Result<[Activity], Error>?

    func fetch(completion: @escaping (Result<[Activity], Error>) -> Void) {
        if let fetchCompletionToBeReturned = fetchCompletionToBeReturned {
            completion(fetchCompletionToBeReturned)
        }
    }
}
