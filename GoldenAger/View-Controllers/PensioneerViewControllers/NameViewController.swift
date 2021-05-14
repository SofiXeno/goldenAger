//
//  NameViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 12.05.2021.
//

import UIKit

class NameViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Utilities.paddingTextField(name)
    }
    


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Create a variable to store the name the user entered on textField
            let nickName = name.text ?? ""
                
        
            let destinationVC = segue.destination as! QAViewController
            destinationVC.nickName = nickName
        
        
    }


}
