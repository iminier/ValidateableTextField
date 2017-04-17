## Synopsis

UITexfield subclass that implements data validation. Using the strategy pattern you can have a phone validator or an email validator for now. 

## Code Example

Show what the library does as concisely as possible, developers should be able to figure out **how** your project solves their problem by looking at the code example. Make sure the API you are showing off is obvious, and that your code is short and concise.

## Motivation

I created this as a tool to save me time and reuse code with data validation in my projects. I decided to share it with anyone who thinks can use it.

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
        if textField == emailTextField {
            if !emailTextField.isValidInput() {
                invalidEmailAlert(email: emailTextField.text)
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
