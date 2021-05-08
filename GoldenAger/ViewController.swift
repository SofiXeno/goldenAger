//
//  ViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 09.04.2021.
//

import UIKit

class ViewController: UIViewController {
  
    
    @IBOutlet weak var email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.email.frame.height))
        email.leftView = paddingView
        email.leftViewMode = UITextField.ViewMode.always

        
    }


}

