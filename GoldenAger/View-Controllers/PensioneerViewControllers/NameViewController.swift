//
//  NameViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 12.05.2021.
//

import UIKit

class NameViewController: UIViewController,  UITextFieldDelegate {

    @IBOutlet weak var name: UITextField!
    
    var pensioner_registration : PensionerRegistration?
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pensioner_registration = PensionerRegistration()
//        print(pensioner_registration?.name)
        
        self.name.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
                view.addGestureRecognizer(tap) // Add gesture recognizer to background view
        
        
        
        Utilities.paddingTextField(name)
    }
    
    

    @objc func handleTap() {
         name.resignFirstResponder() // dismiss keyoard
      }
    

    func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
        self.view.endEditing(true)
           return true
       }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Create a variable to store the name the user entered on textField
            let destinationVC = segue.destination as! QAViewController
            self.pensioner_registration?.name = name.text!
            destinationVC.pensioner_registration = self.pensioner_registration
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if let pensioner_name = name.text, pensioner_name.count > 0{
            return true
        }
        let alert = UIAlertController(title: "Помилка", message: "Ваше ім'я не може бути пустим", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        return false
        
    }


}
