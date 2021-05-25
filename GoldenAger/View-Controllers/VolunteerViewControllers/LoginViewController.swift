//
//  LoginViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 11.05.2021.
//

import UIKit
import HideShowPasswordTextField
import KeychainSwift

class LoginViewController: UIViewController {
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var password: HideShowPasswordTextField!
    
    @IBOutlet weak var warning: UILabel!
    
    let keychain = KeychainSwift()
    
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var registration: UIButton!
    
    var volonteer_login : VolunteerLogin?
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.warning.text = ""
    
        Utilities.paddingTextField(phone)
        
    }
    
    @IBAction func loginOnClick(_ sender: UIButton) {
        
        
        let volunteer_password = password!.text!
        do {let volunteer_phone = phone.text
            
            let regex = try NSRegularExpression(pattern: "^380[5-9][0-9]\\d{7}$", options: .caseInsensitive)
            
            let matches = regex.firstMatch(in: volunteer_phone!, options: [], range: NSRange(location: 0, length: volunteer_phone!.count))
            
            if (volunteer_password.count >= 5) && (matches != nil){
                
                Reqs.post(url:"/auth/login",
                          params:["phone":phone.text!, "password":password.text!, "is_volunteer" : true],
                          onSuccess: {
                            (res: Token) in
                            
                            self.warning.text = ""
                                      
                            self.keychain.set(res.token, forKey: "token")
                            
                            self.performSegue(withIdentifier: "loginRequest_Volunteer", sender: self)
                            
                            print(res.token)
                          },
                          onFail: {
                            (res : MessageResponse) in
                            
                            self.warning.text = res.message
                            self.warning.textColor = .indianRed
                            
                            print(res.message)
                            
                          })
            }
            else {let alert = UIAlertController(title: "Помилка", message: "Пароль має бути більшим за 5 символів; телефон має бути заданим у форматі 380XXXXXXXXX і не може бути пустим", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
            alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
                
            }
            
        } catch{
            print("Неправильний телефон")
        }
        
       
      

    }
    
    @IBAction func registationOnClick(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "registration", sender: self)
        
    }
    
    
  
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Create a variable to store the name the user entered on textField
//
//
//        if login.isSelected {
//
//            self.volonteer_login?.phone = phone.text!
//            self.volonteer_login?.password = password.text!
//
//
//            let tabCtrl: UITabBarController = segue.destination as! UITabBarController
//            let nav = tabCtrl.viewControllers![0] as! UINavigationController
//            let destinationVC = nav.topViewController as! InboxViewController
//
//            destinationVC.volonteer_login = self.volonteer_login
//            self.performSegue(withIdentifier: "login", sender: self)
//
//        }
//
//        if registration.isSelected {
//            let destinationVC = segue.destination as! RegistrationViewController
//            self.performSegue(withIdentifier: "registration", sender: self)}
//
//    }
    
    
    
    
    
//
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//
//        if (identifier=="loginRequest_Volunteer"){
//            let volunteer_password = password!.text!
//            do {let volunteer_phone = phone.text
//
//                let regex = try NSRegularExpression(pattern: "^380[5-9][0-9]\\d{7}$", options: .caseInsensitive)
//
//                let matches = regex.firstMatch(in: volunteer_phone!, options: [], range: NSRange(location: 0, length: volunteer_phone!.count))
//
//                if (volunteer_password.count >= 5) && (matches != nil){
//                    return true
//                }
//
//            } catch{
//                print("Неправильний телефон")
//            }
//
//            let alert = UIAlertController(title: "Помилка", message: "Пароль має бути більшим за 5 символів; телефон має бути заданим у форматі 380XXXXXXXXX і не може бути пустим", preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
//            alert.addAction(okAction)
//            self.present(alert, animated: true, completion: nil)
//            return false
//
//        }
//         else {
//               return true
//    }
//    }

}
