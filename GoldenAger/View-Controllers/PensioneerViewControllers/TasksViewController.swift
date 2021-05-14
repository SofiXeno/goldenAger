//
//  TasksViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 14.05.2021.
//

import UIKit

class TasksViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let service = TaskTemplateService(baseUrl: "https://golden-ager.herokuapp.com/template")
        service.getAllTasks(endPoint: "/")
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
