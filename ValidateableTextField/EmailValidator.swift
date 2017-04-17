import UIKit

class EmailValidator: Validateable {
    
    func isValidInput(_ input: UITextField) -> Bool {
        guard let text = input.text else {
            return false
        }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: text)
    }
}
