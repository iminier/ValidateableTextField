//
//  EmailValidatorTests.swift
//  ValidateableTextField
//
//  Created by Ivan Minier on 6/30/17.
//  Copyright © 2017 Alberto Vega Gonzalez. All rights reserved.
//
//  Used TestCases found at https://blogs.msdn.microsoft.com/testing123/2009/02/06/email-address-test-cases/
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
    
    func testNumAtDomainResturnsTrue() {
        let email = "1234567890@domain.com"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertTrue(result)
    }
    
    func testEmailAtDomaindashDomainResturnsTrue() {
        let email = "email@domain-one.com"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertTrue(result)
    }
    
    func testUnderscoresAsAddressReturnsTrue() {
        let email = "_______@domain.com"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertTrue(result)
    }
    
    func testEmailAtTopLevelDomainReturnsTrue() {
        let email = "email@domain.name"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertTrue(result)
    }
    
    func testDashInAddressReturnsTrue() {
        let email = "firstname-lastname@domain.com"
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

    func testPlainAddressReturnsFalse() {
        let email = "plainaddress"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertFalse(result)
    }
    
    func testGarbageReturnsFalse() {
        let email = "#@%^%#$@#$@#.com"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertFalse(result)
    }
    
    func testMissingAddressReturnsFalse() {
        let email = "@domain.com"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertFalse(result)
    }
    
    func testEncodedHTMLWithinEmailReturnsFalse() {
        let email = "Joe Smith <email@domain.com>"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertFalse(result)
    }
    
    func testNoAddressWithEmaildotSubdomainReturnsFalse() {
        let email = "email.domain.com"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertFalse(result)
    }
    
    func testEmailWithTwoAtSymbolsReturnsFalse() {
        let email = "email@domain@domain.com"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertFalse(result)
    }
    
    func testPeriodBeforeFirstLetterOfAddressReturnsFalse() {
        let email = ".email@domain.com"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertFalse(result)
    }
    
    func testTrailingDotAfterAddressReturnsFalse() {
        let email = "email.@domain.com"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertFalse(result)
    }
    
    func testTwoDotsInAddressReturnsFalse() {
        let email = "email..email@domain.com"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertFalse(result)
    }
    
    func testUnicodeCharEmailReturnsFalse() {
        let email = "あいうえお@domain.com"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertFalse(result)
    }
    
    func testTextAfterEmailReturnsFalse() {
        let email = "email@domain.com (Joe Smith)"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertFalse(result)
    }
    
    func testMissingTopLevelDomain() {
        let email = "email@domain"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertFalse(result)
    }
    
    func testLeadingDashInDomainReturnsFalse() {
        let email = "email@-domain.com"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertFalse(result)
    }
    
    func testInvalidIpAddressReturnsFalse() {
        let email = "email@111.222.333.44444"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertFalse(result)
    }
    
    func testTwodotsInDomainReturnsFalse() {
        let email = "email@domain..com"
        let result = emailValidatorUT.isValidInput(email)
        
        XCTAssertFalse(result)
    }
}
