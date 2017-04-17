## Synopsis

UITexfield subclass written in Swift that implements data validation. For now you can have a phone validator or an email validator. Using the strategy pattern
you can choose the type of validation you need.

## Motivation

I created this as a tool to save me time, keep lean controllers and avoid code duplication when I need data validation in my projects. 

## Installation

-  Copy the .swift files into your project.
- In storyboard select your UITextField, open identity inspector in the Utilities bar on the right side panel and change the class for ValidateableTextField.
- create an IBOutlet in code and hook it with your textfield in storyboard
```swift
        @IBOutlet weak var phoneTextField: ValidateableTextField!
```
- determine the type of validation you need for your textfield. In this case we will choose phone validation.
```swift
        // create an instance of phone validator.
        let phoneValidator = PhoneValidator()
        // set it as the validator for your text field.
        phoneTextField.setInputValidator(phoneValidator)
```

- Do your normal uitextfield setup.
```swift
        // In this case we are setting the view controller as the delegate.
        phoneTextField.delegate = self
        // we are choosing the keyboard type (optional)
        phoneTextField.keyboardType = .phonePad
```

- Validate in textFieldShouldEndEditing.
```swift
func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {

        if textField == emailTextField {
            if !emailTextField.isValidInput() {
                // if input is not valid handle that case here. In this case we alert the user.
                invalidEmailAlert(email: emailTextField.text)
            }
        }
}
```

- Or anywhere else you need. Like before dismissing the view controller.
```swift
        @IBAction func doneButtonPressed(_ sender: AnyObject) {

            if !emailTextField.isValidInput() {
                invalidEmailAlert(email: emailTextField.text)
                return
            }
            self.performSegueToReturnBack()
        }

```

## Tests

Pending Unit Tests.

## Contributors

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## License

ValidateableTextField is released under the MIT license. [See LICENSE](https://github.com/LICENSE) for details.
