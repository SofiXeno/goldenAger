//
//  ProfileVoluntTableViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 22.05.2021.
//

import UIKit

class ProfileVoluntTableViewController: UITableViewController {
    @IBOutlet weak var name_surname: UILabel!
    
    @IBOutlet weak var organization: UILabel!

    
    @IBOutlet weak var birthday: UILabel!
    
    @IBOutlet weak var phone: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Reqs.get(url: "/users/current", params: nil, onSuccess: {(res: UserV) in
         
            print(res)
            self.name_surname.text = res.last_name + " " + res.first_name
            self.organization.text = "«" + res.organization + "»"
            self.phone.text = res.phone
            self.birthday.text = DateHelpers.dateToServerString(date: res.birthday)

            
         
        }, onFail:{res in print(res)})
    }
    @IBAction func logOut(_ sender: UIButton) {
        
        
        let refreshAlert = UIAlertController(title: "Вихід", message: "Ви впевнені що хочете вийти?", preferredStyle: .alert)

        refreshAlert.addAction(UIAlertAction(title: "Так", style: .default, handler: { (action: UIAlertAction!) in
            let story = UIStoryboard(name: "Main", bundle: nil)
                 let controller = story.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
                 self.present(controller, animated: true, completion: nil)
        }))

        refreshAlert.addAction(UIAlertAction(title: "Ні", style: .cancel, handler: { (action: UIAlertAction!) in
            refreshAlert.dismiss(animated: true, completion: nil)
        }))

        present(refreshAlert, animated: true, completion: nil)
        
    }

  
