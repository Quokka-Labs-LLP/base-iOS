//
//  HelperMethods.swift
//  BaseProject
//
//  Created by Himanshu Kesharwani on 07/06/23.
//

import Foundation
import UIKit

class HelperMethods {
    
    class  public func validatePhoneNumber(value: String) -> Bool {
        let phoneRegex = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    
    class   public  func validateEmail(userEmail: String) -> Bool
    {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: userEmail)
    }
    
    class public func textFieldShowAlert(textField : UITextField,alertMessage : String){
        if (textField.text!.isEmpty){
//            AlertMessage.sharedAlertMessage.showAlert(alertText: alertMessage)
        }
    }
    
}
