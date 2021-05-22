//
//  LoginPasswordViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 22.05.2021.
//

import UIKit
import HideShowPasswordTextField

class LoginPasswordViewController: UIViewController {

    @IBOutlet weak var password: HideShowPasswordTextField!
    
    var pensioner_login : PensionerLogin?
    
    
    @IBAction func logIn(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(pensioner_login)

        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Create a variable to store the name the user entered on textField
         self.pensioner_login?.password = password.text ?? ""


      //  let destinationVC = segue.destination as! CategoriesViewController

        
        let tabCtrl: UITabBarController = segue.destination as! UITabBarController
        let nav = tabCtrl.viewControllers![0] as! UINavigationController
        let destinationVC = nav.topViewController as! CategoriesViewController
        
        destinationVC.pensioner_login = self.pensioner_login

        
        print(pensioner_login)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        let pensioner_password1 = password.text ?? ""

        
        if  (pensioner_password1.count >= 6) {
            return true
        }
        let alert = UIAlertController(title: "Помилка", message: "Пароль має бути більшим за 6 символів", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        return false
        
    }

}
