//
//  ConfirmationViewTests.swift
//  ConfirmationTests
//
//  Created by Pedro Henrique Martins Barbosa on 05/01/23.
//

import XCTest
@testable import Confirmation

final class ConfirmationViewTests: XCTestCase {
    var sut: ConfirmationView?
    
    override func setUp() {
        super.setUp()
        sut = ConfirmationView()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testConfirmationStackViewElement() {
        XCTAssertEqual(sut?.stackView.axis, .vertical)
        XCTAssertEqual(sut?.stackView.spacing, 8)
        XCTAssertEqual(sut?.stackView.alignment, .center)
    }
    
    func testConfirmationImageViewElement() {
        XCTAssertEqual(sut?.confirmationImageView.image, UIImage(named: "checkmark.circle.fill"))
        XCTAssertEqual(sut?.confirmationImageView.layer.cornerRadius, 50)
        XCTAssertEqual(sut?.confirmationImageView.clipsToBounds, true)
        XCTAssertEqual(sut?.confirmationImageView.tintColor, .systemGreen)
    }
    
    func testConfirmationLabelElement() {
        XCTAssertEqual(sut?.confirmationLabel.text, "Your transfer was successful")
        XCTAssertEqual(sut?.confirmationLabel.textAlignment, .center)
        XCTAssertEqual(sut?.confirmationLabel.font, UIFont.boldSystemFont(ofSize: 17))
        XCTAssertEqual(sut?.confirmationLabel.numberOfLines, 1)
    }
    
    func testConfirmationButtonElement() {
        XCTAssertEqual(sut?.confirmationButton.titleLabel?.text, "Nice!")
        XCTAssertEqual(sut?.confirmationButton.titleLabel?.textColor, .white)
        XCTAssertEqual(sut?.confirmationButton.layer.cornerRadius, 14)
    }
}
