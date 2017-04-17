//
//  DataValidator.swift
//  ePremio
//
//  Created by Alberto Vega Gonzalez on 10/28/16.
//  Copyright © 2016 Alberto Vega Gonzalez. All rights reserved.
//

import Foundation

class DataValidator {
    class func validate(phone: String) -> Bool {
        let PHONE_REGEX = "^\\(\\d{3}\\)\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: phone)
        return result
    }
}
