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

//  Copyright © 2016 Alberto Vega Gonzalez.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
