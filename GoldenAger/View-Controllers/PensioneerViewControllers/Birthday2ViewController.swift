//
//  Birthday2ViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 12.05.2021.
//

import UIKit

class Birthday2ViewController: UIViewController {

    var pensioner_registration : PensionerRegistration?
    
    @IBOutlet weak var birthday: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Create a variable to store the name the user entered on textField
        self.pensioner_registration!.birthday = birthday.date
     
    
            let destinationVC = segue.destination as! RegisterPhoneViewController
        
        destinationVC.pensioner_registration = self.pensioner_registration
        
    }

}
