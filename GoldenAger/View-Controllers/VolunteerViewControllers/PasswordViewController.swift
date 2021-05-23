//
//  PasswordViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 15.05.2021.
//

import UIKit
import HideShowPasswordTextField
import CSS3ColorsSwift
import Hue

class PasswordViewController: UIViewController {
    @IBOutlet weak var password: HideShowPasswordTextField!
    
    @IBOutlet weak var warning: UILabel!
    @IBOutlet weak var repeatPassword: HideShowPasswordTextField!
    
    var volonteer_registration : VolunteerRegistration?
    
    
    @IBAction func registrationOnClick(_ sender: UIButton) {
        
        
        let volunteer_password1 = password.text ?? ""
        let volunteer_password2 = repeatPassword.text ?? ""
        
        if  (volunteer_password1 == volunteer_password2) && (volunteer_password1.count >= 5) && (volunteer_password2.count >= 5){
         
            
            Reqs.post(url:"/auth/registration",
                      params:["first_name" : volonteer_registration?.name,
                              "last_name": volonteer_registration?.surname,
                              "birthday": DateHelpers.dateToServerString(date: (volonteer_registration?.birthday)!),
                              "is_volunteer": true,
                              "organization" : volonteer_registration?.organization,
                              "phone" : volonteer_registration?.phone,
                              "password" : password.text
                      ],
                      onSuccess:{ (res : MessageResponse) in
                        self.warning.text = res.message
                        self.warning.textColor = .paleGreen
                        
                        self.performSegue(withIdentifier: "registrationRequest_Volunteer", sender: self)
                        
                        print(res)},
                      onFail: {(res : MessageResponse) in
                        
                        self.warning.text = res.message + "!"
                        self.warning.textColor = .indianRed
                        
                        print(res.message)})
            
            
        }
        else {let alert = UIAlertController(title: "Помилка", message: "Паролі в двох полях мають співпадати та бути більшими за 5 символів", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
        alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)}
     
    
        
    }
    
    
    
    override func viewDidLoad() {
        print(volonteer_registration)
        super.viewDidLoad()
        self.warning.text = ""
        
        // Do any additional setup after loading the view.
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Create a variable to store the name the user entered on textField
//        self.volonteer_registration?.password = password.text ?? ""
//
//
//        //  let destinationVC = segue.destination as! CategoriesViewController
//
//
//        let tabCtrl: UITabBarController = segue.destination as! UITabBarController
//        let nav = tabCtrl.viewControllers![0] as! UINavigationController
//        let destinationVC = nav.topViewController as! InboxViewController
//
//        destinationVC.volonteer_registration = self.volonteer_registration
//
//
//
//    }
    
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//
//        let volunteer_password1 = password.text ?? ""
//        let volunteer_password2 = repeatPassword.text ?? ""
//
//        if  (volunteer_password1 == volunteer_password2) && (volunteer_password1.count >= 5) && (volunteer_password2.count >= 5){
//            return true
//        }
//        let alert = UIAlertController(title: "Помилка", message: "Паролі в двох полях мають співпадати та бути більшими за 5 символів", preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
//        alert.addAction(okAction)
//        self.present(alert, animated: true, completion: nil)
//        return false
//
//    }
}
