//
//  SignUpViewController+Notification.swift
//  Lesson10HW
//

//

import UIKit

extension SignUpViewController {
    
    func subscrubeNotifications() {
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
         print("keyboardWillShow")
        let keyboardHeight = keyboardHeight(from: notification)
    }

    @objc func keyboardWillHide(notification: NSNotification){
         print("keyboardWillHide")
        let keyboardHeight = keyboardHeight(from: notification)
    }
    
    private func keyboardHeight(from notification: NSNotification) -> CGFloat {
        
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            return keyboardHeight
        }
        
        return 0.0
    }
}
