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
    var task_id:String?
    
    @IBOutlet weak var createTask: UIButton!
    
    var textNext1:String?
    var textNext2:String?
    
    @IBOutlet weak var warning: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(task_id)
        
        self.task_title.text = self.text
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func findVolunteer(_ sender: UIButton) {
        
        
        Reqs.post(url:"/task/create",
                  params:["template_id" : self.task_id!],
                  onSuccess:{ (res : MessageResponse) in
                    
                    self.warning.text = ""
                    
                    
                    self.textNext1 = "Заявка з Вашим завданням була успішно створена !"
                    self.textNext2 = "Дізнайтеся чи знайшовся волонтер, котрий прийняв Ваше завдання волонтер, натиснувши на кнопку"
                    
                    
                    self.performSegue(withIdentifier: "successTaskCreation", sender: self)
                    
                    print(res)
                    
                    
                    self.createTask.alpha = 0
                    
                    
                  },
                  onFail: {(res : MessageResponse) in
                    
                    self.warning.text = res.message + " Зачекайте доки його прийме волонтер"
                    self.warning.textColor = .indianRed
                    
                    print(res.message)})
        
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Create a variable to store the name the user entered on textField
        
        if let findVC = segue.destination as? PCurrentTaskViewController {
            findVC.textForSuccess1 = self.textNext1
            findVC.textForSuccess2 = self.textNext2
        
        }
        
    
    
    }}
