//
//  LoginPasswordViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 22.05.2021.
//

import UIKit
import HideShowPasswordTextField
import KeychainSwift
import CSS3ColorsSwift
import Hue

class LoginPasswordViewController: UIViewController {
    
    let keychain = KeychainSwift()
    
    @IBOutlet weak var warning: UILabel!
    
    @IBOutlet weak var password: HideShowPasswordTextField!
    
    var pensioner_login : PensionerLogin?
    
    
    @IBAction func logIn(_ sender: Any) {
        
        
        let pensioner_password1 = password.text ?? ""
        
        
        if  (pensioner_password1.count >= 5) {
            
            Reqs.post(url:"/auth/login",
                      params:["phone":pensioner_login?.phone, "password":password.text,
                              "is_volunteer" : false],
                      onSuccess: {
                        
                        (res: Token) in
                        self.warning.text = ""
                        self.keychain.set(res.token, forKey: "token")
                        self.performSegue(withIdentifier: "loginRequest_Pensioner", sender: self)
                        print(res.token)
                      },
                      onFail: {
                        (res : MessageResponse) in
                        
                        self.warning.text = res.message
                        self.warning.textColor = .indianRed
                        
                        print(res.message)
                        
                      })
            
            
        }
        else{ let alert = UIAlertController(title: "Помилка", message: "Пароль має бути більшим за 5 символів", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(pensioner_login)
        
        
    }
    
}
