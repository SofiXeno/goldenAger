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
    
//    var nickName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.label_name.text = "Вітаю " + pensioner_registration!.name! + "!"
     
 
        print(self.pensioner_registration!.name!)
        
    }
    
  
      
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Create a variable to store the name the user entered on textField
        
        if noBtn.isSelected {
        
            let destinationVC = segue.destination as! SurnameViewController
            destinationVC.pensioner_registration = self.pensioner_registration
        }
        if yesBtn.isSelected {
            let destinationVC = segue.destination as! PhoneViewController
            
        }
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
