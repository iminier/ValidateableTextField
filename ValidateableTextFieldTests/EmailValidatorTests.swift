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
    
    var emailValidatorVC = EmailValidator()
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBadEmailGeneric() {
        let email = "-@domain.com"
        let result = emailValidatorVC.isValidInput(email)
        
        XCTAssertFalse(result)
    }
    
    func testGoodEmailGeneric() {
        let email = "email@domain.com"
        let result = emailValidatorVC.isValidInput(email)
        
        XCTAssertTrue(result)
        
    }
    
}
