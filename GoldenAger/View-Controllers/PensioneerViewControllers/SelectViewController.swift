//
//  SelectViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 22.05.2021.
//

import UIKit

class SelectViewController: UIViewController {

    @IBOutlet weak var task_title: UILabel!
    
     var text: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(text)
        
        self.task_title.text = self.text
        
        // Do any additional setup after loading the view.
    }
    

 
     @IBAction func findVolunteer(_ sender: UIButton) {
     }
  

}
