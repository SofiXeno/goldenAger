//
//  RegistrationViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 12.05.2021.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var surname: UITextField!
    @IBOutlet weak var phone: UITextField!
    
    
    var volonteer_registration : VolunteerRegistration?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.volonteer_registration = VolunteerRegistration()
        
        Utilities.paddingTextField(name)
        Utilities.paddingTextField(surname)
        Utilities.paddingTextField(phone)

    }
    
    @IBAction func back(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "backToLogin", sender: self)
        
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? OrganizationViewController{
        self.volonteer_registration?.name = name.text!
        self.volonteer_registration?.surname = surname.text!
        self.volonteer_registration?.phone = phone.text!
        
            destinationVC.volonteer_registration = self.volonteer_registration}
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        let volunteer_name = name!.text!
        let volunteer_surname = surname!.text!
        
        if (identifier != "backToLogin"){
        do {let volunteer_phone = phone.text
            
            let regex = try NSRegularExpression(pattern: "^380[5-9][0-9]\\d{7}$", options: .caseInsensitive)
            
            let matches = regex.firstMatch(in: volunteer_phone!, options: [], range: NSRange(location: 0, length: volunteer_phone!.count))
            
            if (volunteer_surname.count > 0) && (volunteer_name.count > 0) && (matches != nil){
                return true
            }
            
            
        } catch{
            print("Неправильний телефон")
        }
        
        let alert = UIAlertController(title: "Помилка", message: "Ваше ім'я та прізвище не може бути пустим; телефон має бути заданим у форматі 380XXXXXXXXX і не може бути пустим", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        return false
        
        }
         else {
               return true
    }
        
    }
    
    
}

