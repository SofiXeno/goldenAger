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
    
   // var success: Bool = false
    
    weak var delegate: CollectionViewCellDelegate?
    
 
    @IBAction func acceptTask(_ sender: UIButton) {
        
        print(self._id!)

//        print(self)
        
//        let refreshAlert = UIAlertController(title: "Прийняти завдання", message: "Ви впевнені що хочете прийняти завдання? Це незворотна дія, Вам доведеться виконати завдання яке ви прийняли", preferredStyle: .alert)
//
//        refreshAlert.addAction(UIAlertAction(title: "Так", style: .default, handler: { (action: UIAlertAction!) in
            
            Reqs.post(url: "/task/take/" + self._id!, params: nil, onSuccess: {(res : MessageResponse) in
                
                print(res.message)
                
          
                self.backgroundColor = .paleGreen
                self.delegate?.showAlert(title: "Вітаємо", res: res.message + " Перегляньте його в своєму профілі")
                
                
                //         print(self.Tasks)
                
            }, onFail:{(res : MessageResponse) in
                

                print(res.message)
 
                self.delegate?.showAlert(title: "Помилка", res: res.message)
              
                
                
            })
            
       // }))
        
//        refreshAlert.addAction(UIAlertAction(title: "Ні", style: .cancel, handler: { (action: UIAlertAction!) in
//            refreshAlert.dismiss(animated: true, completion: nil)
//        }))
        
       // present(refreshAlert, animated: true, completion: nil)
        
        
        
        
    }
    
}
