//
//  ConfirmationViewTests.swift
//  ConfirmationTests
//
//  Created by Alexandre Cardoso on 03/11/22.
//

import XCTest
@testable import Confirmation

class ConfirmationViewTests: XCTestCase {
    
    var sut: ConfirmationView!

    override func setUp() {
        super.setUp()
        sut = ConfirmationView()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testElements() {
        XCTAssertEqual(sut.stackView.axis, .vertical)
        XCTAssertEqual(sut.stackView.spacing, 8)
        XCTAssertEqual(sut.stackView.alignment, .center)
        
        XCTAssertEqual(sut.confirmationImageView.image, UIImage(named: "checkmark.circle.fill"))
        XCTAssertEqual(sut.confirmationImageView.layer.cornerRadius, 50)
        XCTAssertTrue(sut.confirmationImageView.clipsToBounds)
        XCTAssertEqual(sut.confirmationImageView.tintColor, .systemGreen)
        
        XCTAssertEqual(sut.confirmationLabel.text, "Your transfer was successful")
        XCTAssertEqual(sut.confirmationLabel.textAlignment, .center)
        
        XCTAssertEqual(sut.confirmationButton.layer.cornerRadius, 14)
        XCTAssertEqual(sut.confirmationButton.titleLabel?.text, "Nice!")
        XCTAssertEqual(sut.confirmationButton.titleLabel?.textColor, .white)
    }

}
