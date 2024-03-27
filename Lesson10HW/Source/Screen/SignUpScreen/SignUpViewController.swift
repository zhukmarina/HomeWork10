//
//  SignUpViewController.swift
//  Lesson10HW
//

//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: SignUpView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscrubeNotifications()
        contentView.cardNumberTextField.delegate = self
        contentView.cvvTextField.delegate = self
        
        contentView.emailNameTextField.keyboardType = .emailAddress
        contentView.passwordTextField.isSecureTextEntry = true
        contentView.confirmPasswordTextField.isSecureTextEntry = true
        contentView.cvvTextField.isSecureTextEntry = true
        contentView.cardNumberTextField.keyboardType = .numberPad
        contentView.cvvTextField.keyboardType = .numberPad
        
        contentView.firstNameTextField.keyboardType = .default
        contentView.lastNameTextField.keyboardType = .default
        contentView.countryTextField.keyboardType = .default
        contentView.cityTextField.keyboardType = .default
        contentView.addressTextField.keyboardType = .default
        contentView.expDateTextField.keyboardType = .default
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let fullString = (textField.text ?? "" ) + string

        if textField == contentView.cardNumberTextField {
            
            return fullString.count <= 16
        }else if textField == contentView.cvvTextField {
            return fullString.count <= 3
        }
        
        return true
    }
}

