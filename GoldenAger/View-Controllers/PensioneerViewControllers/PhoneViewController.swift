//
//  PhoneViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 12.05.2021.
//

import UIKit

class PhoneViewController: UIViewController {
    @IBOutlet weak var phone: UITextField!
    
    var pensioner_login : PensionerLogin?
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        
        self.pensioner_login  = PensionerLogin()
        
        
        Utilities.paddingTextField(phone)
      
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Create a variable to store the name the user entered on textField
        self.pensioner_login!.phone = phone.text!
        
        
        let destinationVC = segue.destination as! LoginPasswordViewController
        
        destinationVC.pensioner_login = self.pensioner_login
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        do{ let pensioner_phone = phone.text
            
            let regex = try NSRegularExpression(pattern: "^380[5-9][0-9]\\d{7}$", options: .caseInsensitive)
            
            let matches = regex.firstMatch(in: pensioner_phone!, options: [], range: NSRange(location: 0, length: pensioner_phone!.count))
            
            if matches != nil{
                return true
            }
            
            
        } catch{
            print("Неправильний телефон")
        }
        
        let alert = UIAlertController(title: "Помилка", message: "Телефон має бути заданим у форматі 380XXXXXXXXX і не може бути пустим", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        return false
        
    }

}
