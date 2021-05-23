//
//  SurnameViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 12.05.2021.
//

import UIKit

class SurnameViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var surname: UITextField!
    
    
    var pensioner_registration : PensionerRegistration?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        print(pensioner_registration)
        
        
        self.surname.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
                view.addGestureRecognizer(tap) // Add gesture recognizer to background view
        
        

        Utilities.paddingTextField(surname)
    }
    
    
    
    
    @objc func handleTap() {
         surname.resignFirstResponder() // dismiss keyoard
      }
    

    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
           return true
       }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Create a variable to store the name the user entered on textField
        self.pensioner_registration?.surname = surname.text!
         let destinationVC = segue.destination as! Birthday2ViewController
         destinationVC.pensioner_registration = self.pensioner_registration
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if let pensioner_surname = surname.text, pensioner_surname.count > 0{
            return true
        }
        let alert = UIAlertController(title: "Помилка", message: "Ваше прізвище не може бути пустим", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        return false
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
