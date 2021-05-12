//
//  LoginViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 11.05.2021.
//

import UIKit
import HideShowPasswordTextField

class LoginViewController: UIViewController {
    @IBOutlet weak var phone: UITextField!
    
  
    
    
override func viewDidLoad() {
        super.viewDidLoad()
        Utilities.paddingTextField(phone)
      
        // Do any additional setup after loading the view.
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
