//
//  PhoneValidatorTests.swift
//  ValidateableTextField
//
//  Created by Ivan Minier on 7/9/17.
//  Copyright © 2017 Alberto Vega Gonzalez. All rights reserved.
//

import XCTest
@testable import ValidateableTextField

class PhoneValidatorTests: XCTestCase {
    
    var phoneValidatorUT = PhoneValidator()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testValidPhoneNumberReturnsTrue() {
        let phoneNum = "323-600-6000"
        let result = phoneValidatorUT.isValidInput(phoneNum)
        
        XCTAssertTrue(result)
    }
    
    func testValidPhoneNumWithoutDashesReturnsTrue() {
        let phoneNum = "3236006000"
        let result = phoneValidatorUT.isValidInput(phoneNum)
        
        XCTAssertTrue(result)
    }
    
    func testValidPhoneNumWithParenReturnsTrue() {
        let phoneNum = "(323)600-6000"
        let result = phoneValidatorUT.isValidInput(phoneNum)
        
        XCTAssertTrue(result)
    }
    
    func testValidPhoneNumWithParenNoDashesReturnsTrue() {
        let phoneNum = "(323)6006000"
        let result = phoneValidatorUT.isValidInput(phoneNum)
        
        XCTAssertTrue(result)
    }
    
}
