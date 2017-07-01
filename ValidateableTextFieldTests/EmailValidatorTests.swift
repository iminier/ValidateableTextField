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
    
    func testBadEmailGeneric() {
        let email = "-@domain.com"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertFalse(result)
    }
    
    func testGoodEmailGeneric() {
        let email = "email@domain.com"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertTrue(result)
    }
    
    func testCOdotUKEmail() {
        let email = "name@domain.co.uk"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertTrue(result)
    }
    
    func testDashForDomain() {
        let email = "name@-.com"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertFalse(result)
    }
    
    func testEmailWithoutATSymbol() {
        let email = "namedomain.com"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertFalse(result)
    }
    
    func testBlankEmail() {
        let email = ""
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertFalse(result)
    }
}
