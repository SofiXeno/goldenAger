//
//  LoginViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 11.05.2021.
//

import UIKit
import HideShowPasswordTextField

class LoginViewController: UIViewController {
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var password: HideShowPasswordTextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utilities.paddingTextField(phone)
        
        
    }
    
    @IBAction func validateAction(_ sender: Any) {
        validate()
    }
    
    func validate() {
        do {
            let phone_numb = try phone.validatedText(validationType: ValidatorType.phone)
            let pass = try password.validatedText(validationType: ValidatorType.password)
            let data = LoginData(phone: phone_numb, password: pass)
            save(data)
        } catch(let error) {
            showAlert(for: (error as! ValidationError).message)
        }
    }
    
    func save(_ data: LoginData) {
        showAlert(for: "Register Successful")
    }
    
    func showAlert(for alert: String) {
        let alertController = UIAlertController(title: nil, message: alert, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    //  func bindKeyboardNotifications() {
    //      NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: nil) { notification in
    //          let keyboardHeight: CGFloat = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height ?? 0
    //          self.bottomConstraint.constant  = 20 + keyboardHeight
    //      }
    //
    //      NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: nil) { _ in
    //          self.bottomConstraint.constant = 20.0
    //      }
    //  }
    
}
extension UITextField {
    func validatedText(validationType: ValidatorType) throws -> String {
        let validator = ValidatorFactory.validatorFor(type: validationType)
        return try validator.validated(self.text!)
    }
}
