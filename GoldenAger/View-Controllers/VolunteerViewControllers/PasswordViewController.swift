//
//  PasswordViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 15.05.2021.
//

import UIKit
import HideShowPasswordTextField

class PasswordViewController: UIViewController {
    @IBOutlet weak var password: HideShowPasswordTextField!
    
    @IBOutlet weak var repeatPassword: HideShowPasswordTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

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
