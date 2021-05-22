//
//  RegisterPhoneViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 15.05.2021.
//

import UIKit

class RegisterPhoneViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var newphone: UITextField!
    
    var pensioner_registration : PensionerRegistration?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
        self.newphone.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
                view.addGestureRecognizer(tap) // Add gesture recognizer to background view
        
    
       
        
        Utilities.paddingTextField(newphone)
        // Do any additional setup after loading the view.
    }
    
    
    
    @objc func handleTap() {
         newphone.resignFirstResponder() // dismiss keyoard
      }
    

    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
           return true
       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Create a variable to store the name the user entered on textField
        self.pensioner_registration!.phone = newphone.text!
        
        
        let destinationVC = segue.destination as! PasswordRegistrViewController
        
        destinationVC.pensioner_registration = self.pensioner_registration
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        do{ let pensioner_phone = newphone.text
            
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
