//
//  ProfileViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 22.05.2021.
//

import UIKit

class ProfileViewController: UITableViewController {
    
    @IBOutlet weak var name_surname: UILabel!
    
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var birthday: UILabel!
    
    var pensioner_registration : PensionerRegistration?
    

    @IBAction func logOut(_ sender: UIButton) {
        
        
        let refreshAlert = UIAlertController(title: "Вихід", message: "Ви впевнені що хочете вийти?", preferredStyle: .alert)

        refreshAlert.addAction(UIAlertAction(title: "Так", style: .default, handler: { (action: UIAlertAction!) in
            let story = UIStoryboard(name: "Main", bundle: nil)
                 let controller = story.instantiateViewController(identifier: "NameViewController") as! NameViewController
                 self.present(controller, animated: true, completion: nil)
        }))

        refreshAlert.addAction(UIAlertAction(title: "Ні", style: .cancel, handler: { (action: UIAlertAction!) in
            refreshAlert.dismiss(animated: true, completion: nil)
        }))

        present(refreshAlert, animated: true, completion: nil)
        
        
        
        
      
        
    }
 
    
    override func viewDidLoad() {
     
        
        
        Reqs.get(url: "/users/60993ca76b6378a974d36dea", params: nil, onSuccess: {(res: [User]) in
         
            
            print(res)
                
            self.name_surname.text = res[0].last_name + " " + res[0].first_name
            self.phone.text = res[0].phone
            self.birthday.text = DateHelpers.dateToServerString(date: res[0].birthday)
            
         
        }, onFail:{res in print(res)})
         
         super.viewDidLoad()
       
    }
    

    
    
    
  


}
