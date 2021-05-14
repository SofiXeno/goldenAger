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
        
        //        let service = TaskTemplateService(baseUrl: "https://golden-ager.herokuapp.com/template")
        //        service.getAllTasks(endPoint: "/")
        
        
//        //https://golden-ager.herokuapp.com/template/getByCategory/609690d67cb3785fc858cc83
//        let service = TaskTemplateService(baseUrl: "https://golden-ager.herokuapp.com/template")
//        service.getTaskFromCategory(endPoint: "/getByCategory/", categoryId: "609690d67cb3785fc858cc83")
//
        
        
        let service = UserService(baseUrl: "https://golden-ager.herokuapp.com/users")
        service.getAllUsers(endPoint: "/")
        
        
//        let service = UserService(baseUrl: "https://golden-ager.herokuapp.com/users")
//        service.getUserById(endPoint: "/", userId: "60993ca76b6378a974d36dea")
//
//        let service = UserService(baseUrl: "https://golden-ager.herokuapp.com/users")
//        service.findFreevolunteers(endPoint: "/findFreeVolunteers")
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
