//
//  ViewController.swift
//  ValidateableTextField
//
//  Created by Alberto Vega Gonzalez on 4/16/17.
//  Copyright © 2017 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var phoneNumberTextField: ValidateableTextField!
    @IBOutlet var emailAddressTextField: ValidateableTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
    }
    
    func setupTextFields() {
        let phoneValidator = PhoneValidator()
        
        phoneNumberTextField.setInputValidator(phoneValidator)
        phoneNumberTextField.delegate = self
        
        let emailValidator = EmailValidator()
        
        emailAddressTextField.setInputValidator(emailValidator)
        emailAddressTextField.delegate = self
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        let validateableTextField =  textField as! ValidateableTextField
        
        do {
            if try !validateableTextField.isValidInput() {
                if validateableTextField == emailAddressTextField {
                    print("This is not valid email")
                }
                if validateableTextField == phoneNumberTextField {
                    print("This is not valid a valid phone number format")
                }
                return false
            }
        } catch {
            print(error.localizedDescription)
        }
        return true
    }
}

