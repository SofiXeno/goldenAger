//
//  InboxViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 15.05.2021.
//

import UIKit

class InboxViewController: UIViewController {
    
    @IBAction func updateForNewTasks(_ sender: UIButton) {
    }
    var volonteer_registration : VolunteerRegistration?
    var volonteer_login : VolunteerLogin?

    override func viewDidLoad() {
        super.viewDidLoad()
        print(volonteer_login)
        print(volonteer_registration)

        // Do any additional setup after loading the view.
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
