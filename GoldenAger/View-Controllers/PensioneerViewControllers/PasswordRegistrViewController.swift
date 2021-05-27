//
//  PasswordRegistrViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 21.05.2021.
//

import UIKit
import HideShowPasswordTextField
import CSS3ColorsSwift
import Hue

class PasswordRegistrViewController: UIViewController {
    @IBOutlet weak var password: HideShowPasswordTextField!
    @IBOutlet weak var warning: UILabel!
    @IBOutlet weak var repeat_password: HideShowPasswordTextField!
    
    @IBAction func Registration(_ sender: Any) {

        
        let pensioner_password1 = password.text ?? ""
        let pensioner_password2 = repeat_password.text ?? ""
        
        if  (pensioner_password1 == pensioner_password2) && (pensioner_password1.count >= 5) && (pensioner_password2.count >= 5){
           
            
            Reqs.post(url:"/auth/registration",
                      params:["first_name" : pensioner_registration?.name,
                              "last_name": pensioner_registration?.surname,
                              "birthday": DateHelpers.dateToServerString(date: (pensioner_registration?.birthday)!),
                                  "is_volunteer": false,
                                  "phone" : pensioner_registration?.phone,
                                  "password" : password.text
                          ],
                onSuccess:{
                    (res : MessageResponse) in
                    
                    self.warning.text = res.message
                    self.warning.textColor = .paleGreen
                    
                    self.performSegue(withIdentifier: "registrationRequest_Pensioner", sender: self)
                    
                     print(res)
                    
                    
                },
                onFail: {(res : MessageResponse) in
                    
                    self.warning.text = res.message + "!"
                    self.warning.textColor = .indianRed
                    
                    print(res.message)})
            
        }
        else{  let alert = UIAlertController(title: "Помилка", message: "Паролі в двох полях мають співпадати та бути більшими за 5 символів", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        
    }
        
    }
        
    var pensioner_registration : PensionerRegistration?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.warning.text=""

    }

}
