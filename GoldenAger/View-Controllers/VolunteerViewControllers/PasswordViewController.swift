//
//  PasswordViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 15.05.2021.
//

import UIKit
import HideShowPasswordTextField

class PasswordViewController: UIViewController {
    @IBOutlet weak var password: HideShowPasswordTextField!
    
    @IBOutlet weak var repeatPassword: HideShowPasswordTextField!
    
    var volonteer_registration : VolunteerRegistration?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Create a variable to store the name the user entered on textField
         self.volonteer_registration?.password = password.text ?? ""


      //  let destinationVC = segue.destination as! CategoriesViewController

        
        let tabCtrl: UITabBarController = segue.destination as! UITabBarController
        let nav = tabCtrl.viewControllers![0] as! UINavigationController
        let destinationVC = nav.topViewController as! InboxViewController
        
        destinationVC.volonteer_registration = self.volonteer_registration

        
        print(volonteer_registration)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        let volunteer_password1 = password.text ?? ""
        let volunteer_password2 = repeatPassword.text ?? ""
        
        if  (volunteer_password1 == volunteer_password2) && (volunteer_password1.count >= 6) && (volunteer_password2.count >= 6){
            return true
        }
        let alert = UIAlertController(title: "Помилка", message: "Паролі в двох полях мають співпадати та бути більшими за 6 символів", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        return false
        
    }
}
