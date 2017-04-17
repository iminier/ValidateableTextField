import UIKit

class ValidateableTextField: UITextField {
    
    var inputValidator: Validateable?
    
    public func setInputValidator(_ validator: Validateable) {
        self.inputValidator = validator
    }
    
    public func isValidInput()-> Bool {
        guard let inputValidator = self.inputValidator else {
            return false
        }
        return inputValidator.isValidInput(self)
    }
}
