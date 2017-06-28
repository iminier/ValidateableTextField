import UIKit

enum DataValidatorError: Error, CustomStringConvertible {
    
    case notInitialized
    var description: String {
        return "Data validator property was not set in ValidateableTextField"
    }
}

class ValidateableTextField: UITextField {
    
    var inputValidator: Validateable?
    
    public func setInputValidator(_ validator: Validateable) {
        self.inputValidator = validator
    }
    
    public func isValidInput() throws -> Bool {
        guard let inputValidator = self.inputValidator else {
            throw DataValidatorError.notInitialized
        }
        return inputValidator.isValidInput(self.text ?? "")
    }
}
