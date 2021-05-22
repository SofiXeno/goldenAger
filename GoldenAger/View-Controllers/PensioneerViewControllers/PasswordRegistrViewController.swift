//
//  PasswordRegistrViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 21.05.2021.
//

import UIKit
import HideShowPasswordTextField

class PasswordRegistrViewController: UIViewController {
    @IBOutlet weak var password: HideShowPasswordTextField!
    
    
    @IBAction func Registration(_ sender: Any) {
    }
    
    @IBOutlet weak var repeat_password: HideShowPasswordTextField!
    
    
    var pensioner_registration : PensionerRegistration?
    
    override func viewDidLoad() {
        super.viewDidLoad()


       
        
        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Create a variable to store the name the user entered on textField
         self.pensioner_registration?.password = password.text ?? ""


      //  let destinationVC = segue.destination as! CategoriesViewController

        
        let tabCtrl: UITabBarController = segue.destination as! UITabBarController
        let nav = tabCtrl.viewControllers![0] as! UINavigationController
        let destinationVC = nav.topViewController as! CategoriesViewController
        
        destinationVC.pensioner_registration = self.pensioner_registration

        
        print(pensioner_registration)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        let pensioner_password1 = password.text ?? ""
        let pensioner_password2 = repeat_password.text ?? ""
        
        if  (pensioner_password1 == pensioner_password2) && (pensioner_password1.count >= 6) && (pensioner_password2.count >= 6){
            return true
        }
        let alert = UIAlertController(title: "Помилка", message: "Паролі в двох полях мають співпадати та бути більшими за 6 символів", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        return false
        
    }
}
