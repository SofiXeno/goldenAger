//
//  QAViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 12.05.2021.
//

import UIKit

class QAViewController: UIViewController {
    @IBOutlet weak var label_name: UILabel!
    var pensioner_registration : PensionerRegistration?
    
    @IBOutlet weak var noBtn: UIButton!
    
    @IBOutlet weak var yesBtn: UIButton!
    
    @IBAction func registrationAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "register", sender: self)
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: "login", sender: self)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.label_name.text = "Вітаю " + pensioner_registration!.name! + "!"
     
        print(pensioner_registration)
 
        print(self.pensioner_registration!.name!)
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

            
        if let registrationVC = segue.destination as? SurnameViewController {
            registrationVC.pensioner_registration = self.pensioner_registration
        }
        

    }
    

         


}
