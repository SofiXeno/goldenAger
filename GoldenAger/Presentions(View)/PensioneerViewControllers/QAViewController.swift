//
//  QAViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 12.05.2021.
//

import UIKit

class QAViewController: UIViewController {
    @IBOutlet weak var label_name: UILabel!
   
    var nickName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label_name.text = "Вітаю " + nickName + "!"
     
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
