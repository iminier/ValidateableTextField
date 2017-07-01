//
//  EmailValidatorTests.swift
//  ValidateableTextField
//
//  Created by Ivan Minier on 6/30/17.
//  Copyright © 2017 Alberto Vega Gonzalez. All rights reserved.
//

import XCTest
@testable import ValidateableTextField

class EmailValidatorTests: XCTestCase {
    
    var emailValidatorUT = EmailValidator()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGoodEmailGenericReturnsTrue() {
        let email = "email@domain.com"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertTrue(result)
    }
    
    func testCOdotUKEmailReturnsTrue() {
        let email = "name@domain.co.uk"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertTrue(result)
    }
    
    func testSubDomainEmailReturnsTrue() {
        let email = "name@some.domain.com"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertTrue(result)
    }
    
    func testDashAtDomainGenericReturnsFalse() {
        let email = "-@domain.com"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertFalse(result)
    }
    
    func testDashForDomainReturnsFalse() {
        let email = "name@-.com"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertFalse(result)
    }
    
    func testEmailWithoutATSymbolReturnsFalse() {
        let email = "namedomain.com"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertFalse(result)
    }
    
    func testBlankEmailReturnsFalse() {
        let email = ""
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertFalse(result)
    }
    //
    func testEmailContainsDotInAddressFieldReturnsTrue() {
        let email = "firstname.lastname@domain.com"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertTrue(result)
    }
    
    func testEmailWithPlusSignInAddressFieldReturnsTrue() {
        let email = "firstname+lastname@domain.com"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertTrue(result)
    }
    
    func testEmailAtIpAddressReturnsTrue() {
        let email = "email@123.123.123.123"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertTrue(result)
    }
    
    func testEmailAtIpInBracketsReturnsTrue() {
        let email = "email@[123.123.123.123]"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertTrue(result)
    }
    
    func testEmailWithQuotesAroundAddressReturnsTrue() {
        let email = "“email”@domain.com"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertTrue(result)
        
    }
    
}

