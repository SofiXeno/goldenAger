//
//  SurnameViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 12.05.2021.
//

import UIKit

class SurnameViewController: UIViewController {

    @IBOutlet weak var surname: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Utilities.paddingTextField(surname)
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
