//
//  FindVoluntViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 22.05.2021.
//

import UIKit

class EndTaskViewController: UIViewController {

    @IBOutlet weak var volunteer_name: UILabel!
    @IBOutlet weak var volunteer_organization: UILabel!
    @IBOutlet weak var volunteer_phone: UILabel!
    @IBOutlet weak var volunteer_birthday: UILabel!
    
    @IBOutlet weak var endTaskBtn: UIButton!
    
    
    var v_name:String?
    var v_organization:String?
    var v_phone:String?
    var v_birthday:String?
    
    var task_id:String?
    
    
    override func viewDidLoad() {
    
        self.volunteer_name.text=self.v_name
        self.volunteer_organization.text=self.v_organization
        self.volunteer_birthday.text=self.v_birthday
        self.volunteer_phone.text=self.v_phone

        super.viewDidLoad()
 
    }
    
//перекинути на категорії
     @IBAction func taskIsDone(_ sender: UIButton) {
        
        Reqs.post(url: "/task/complete", params: nil, onSuccess: {(res : MessageResponse ) in
        
            self.performSegue(withIdentifier: "endTaskSuccess", sender: self)
            print(res.message)
            self.endTaskBtn.alpha = 0

    
        }, onFail:{res in
            print(res.message)
            
        })
        
     }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
