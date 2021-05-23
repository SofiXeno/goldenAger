//
//  BirthdayViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 12.05.2021.
//

import UIKit

class BirthdayViewController: UIViewController {
    @IBOutlet weak var birthday: UIDatePicker!
    
    var volonteer_registration : VolunteerRegistration?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Create a variable to store the name the user entered on textField
        self.volonteer_registration?.birthday = birthday.date
     
    
            let destinationVC = segue.destination as! PasswordViewController
        
        destinationVC.volonteer_registration = self.volonteer_registration
        
    }

}
