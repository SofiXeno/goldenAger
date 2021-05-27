//
//  PCurrentTaskViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 24.05.2021.
//

import UIKit



struct CurrentTaskP {
    
    var id:String
    var title: String
    var time: String
    var description: String
    
    
    
    init(id: String, title: String, time: String, description: String){
        
        self.id = id
        self.title = title
        self.time = time
        self.description = description
    }
    
}

class PCurrentTaskViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    
    @IBOutlet weak var updateForVolunteer: UIButton!
    
    @IBOutlet weak var tasksCurrent: UICollectionView!
    
    
    @IBOutlet weak var success1: UILabel!
    @IBOutlet weak var success2: UILabel!
    
    var textForSuccess1: String?
    var textForSuccess2: String?
    
    
    @IBOutlet weak var warning: UILabel!
    var task_id : String?
    var task_title : String?
    
    var task_about : String?
    var task_time : String?
    
    
    var volunteer_name : String?
    var volunteer_phone : String?
    var volunteer_organization : String?
    var volunteer_birthday : String?
    
    
    override func viewDidLoad() {
        
        Reqs.get(url: "/task/currentTask", params: nil, onSuccess: {(res: ArchiveTasksP) in
            
            self.updateForVolunteer.alpha = 1
            
            self.success1.text = "Заявка з Вашим завданням була успішно створена !"
            self.success2.text = "Дізнайтеся чи знайшовся волонтер, котрий прийняв Ваше завдання волонтер, натиснувши на кнопку"
            
            
            self.task_id = res._id
            self.task_title = res.template_title
            self.task_about = res.template_description
            self.task_time = res.template_time
            
            print(res)
            
            
            self.tasksCurrent.dataSource = self
            self.tasksCurrent.delegate = self
            
        }, onFail:{res in
            
            
            self.success1.text = "У Вас немає поточних завдань"
            self.success2.text = ""
            self.updateForVolunteer.alpha = 0
            
            
            print(res)
            
        })
        
        
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func findVolunteer(_ sender: Any) {
        
        
        Reqs.get(url: "/task/currentVolunteer", params: nil, onSuccess: {(res: MyVolunteer) in
            
            
            if((res._id==nil) || (res.first_name==nil) || (res.last_name==nil) || (res.birthday==nil) || (res.is_free==nil) || (res.is_volunteer==nil) || (res.organization==nil) || (res.password==nil) ){
                
                self.warning.text = "Жоден волонтер ще не прийняв Ваше завдання"
                self.warning.textColor = .indianRed
                
                print(res)
                
            }
            
            else{
   
                self.warning.text = ""
                
                self.volunteer_name = res.last_name! + " " + res.first_name!
                self.volunteer_phone = res.phone!
                self.volunteer_birthday = DateHelpers.dateToServerString(date: res.birthday!)
                self.volunteer_organization =  "«" + res.organization! + "»"
                
                print(res)
                
                self.performSegue(withIdentifier: "successFind", sender: self)
       
            }
            
            
            
            
        }, onFail:{ res in
    
            self.warning.text = "Жоден волонтер ще не прийняв Ваше завдання"
            self.warning.textColor = .indianRed

            print(res)
            
        })
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let endTaskVC = segue.destination as? EndTaskViewController {
            
            endTaskVC.task_id = self.task_id
            
            endTaskVC.v_name = self.volunteer_name
            endTaskVC.v_phone  = self.volunteer_phone
            endTaskVC.v_birthday = self.volunteer_birthday
            endTaskVC.v_organization = self.volunteer_organization
  
        }
        
        
    }
    
    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "currentTaskPCell", for: indexPath) as! ArchiveTaskCollectionViewCell
        
        cell.layer.cornerRadius = 15
        cell.layer.masksToBounds = false
        
        cell._id = self.task_id!
        cell.title.text = self.task_title
        cell.about.text = self.task_about
        cell.time.text = self.task_time
        
        return cell
    }
    
}
