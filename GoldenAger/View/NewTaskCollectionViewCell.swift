//
//  NewTaskCollectionViewCell.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 23.05.2021.
//

import UIKit
import CSS3ColorsSwift

let story = UIStoryboard(name: "Volunteer", bundle: nil)
let controller = story.instantiateViewController(identifier: "InboxV_ViewController") as! InboxViewController


class NewTaskCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var pesionerName: UILabel!
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var about: UILabel!
    
    var _id: String?
    
    weak var delegate: CollectionViewCellDelegate?
    
 
    @IBAction func acceptTask(_ sender: UIButton) {
        
        print(self._id!)

            
            Reqs.post(url: "/task/take/" + self._id!, params: nil, onSuccess: {(res : MessageResponse) in
                
                print(res.message)
                
          
                self.backgroundColor = .paleGreen
                self.delegate?.showAlert(title: "Вітаємо", res: res.message + " Перегляньте його в своєму профілі")
                
                
                //         print(self.Tasks)
                
            }, onFail:{(res : MessageResponse) in
                

                print(res.message)
 
                self.delegate?.showAlert(title: "Помилка", res: res.message)
              
                
                
            })
              
        
        
    }
    
}
