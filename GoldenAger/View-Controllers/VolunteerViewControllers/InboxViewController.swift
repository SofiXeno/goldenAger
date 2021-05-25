//
//  InboxViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 15.05.2021.
//

import UIKit
import CSS3ColorsSwift
import Hue



struct InboxTasks {
    
    var _id:String
    
    var title: String
    var time: String
    var description: String
    var pensioner_name: String

    
    init(_id:String,title: String, time: String, description: String, pensioner_name:String){
        
        self._id = _id
        self.title = title
        self.time = time
        self.description = description
        self.pensioner_name = pensioner_name
        
    }
}


class InboxViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CollectionViewCellDelegate  {
    
    let main = UIColor(hex: "#EFFFFF")
    
    func showAlert(title:String, res: String) {
        let alert = UIAlertController(title: title, message: res, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    var task_id : String?
    
    private var Tasks : [InboxTasks] = []
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var inboxTasksV: UICollectionView!
    
    
    @IBAction func updateForNewTasks(_ sender: UIButton) {
        
        
        
       Tasks = []
        self.inboxTasksV.reloadData()
        
        Reqs.get(url: "/task/availableTasks", params: nil, onSuccess: {(res: [TaskInboxV]) in
            self.image.alpha = 0
            for c in res {
                
                self.Tasks.append(InboxTasks(_id: c._id, title: c.template_title, time: c.template_time, description: c.template_description, pensioner_name: c.pensioner_surname + " " + c.pensioner_name))
                
            }
            self.tabBarController?.tabBar.items?[0].badgeValue = "\(self.Tasks.count)"

            self.inboxTasksV.reloadData()
            
            
            if (self.Tasks.isEmpty){
               self.image.alpha = 1
                self.tabBarController?.tabBar.items?[0].badgeValue = nil
            }
            
            print(self.Tasks)
            
        }, onFail:{res in
           
            print(res)})
        
    }
        
//        let refreshAlert = UIAlertController(title: "Прийняти завдання", message: "Ви впевнені що хочете прийняти завдання? Це незворотна дія, Вам доведеться виконати завдання яке ви прийняли", preferredStyle: .alert)
//
//        refreshAlert.addAction(UIAlertAction(title: "Так", style: .default, handler: { (action: UIAlertAction!) in
//
//
//
//
//            Reqs.post(url: "/task/take/" + self.task_id!, params: nil, onSuccess: {(res : MessageResponse) in
//
//             print(res)
//
//
//                let alert = UIAlertController(title: "Вітаю", message: res.message, preferredStyle: .alert)
//                let okAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
//                alert.addAction(okAction)
//                self.present(alert, animated: true, completion: nil)
//
//
//                //         print(self.Tasks)
//
//            }, onFail:{(res : MessageResponse) in
//
//                let alert = UIAlertController(title: "Помилка", message: res.message, preferredStyle: .alert)
//                let okAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
//                alert.addAction(okAction)
//                self.present(alert, animated: true, completion: nil)
//
//                print(res)
//
//
//            })
//
//        }))
//
//        refreshAlert.addAction(UIAlertAction(title: "Ні", style: .cancel, handler: { (action: UIAlertAction!) in
//            refreshAlert.dismiss(animated: true, completion: nil)
//        }))
//
//        present(refreshAlert, animated: true, completion: nil)
//
//
        
        
    
    
    override func viewDidLoad() {
        
//        acceptTask.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(tap(_:))))
        
        super.viewDidLoad()
        
        self.inboxTasksV.dataSource = self
        self.inboxTasksV.delegate = self

    }
    
    
    
    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return Tasks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newTaskCell", for: indexPath) as! NewTaskCollectionViewCell
        
        cell.backgroundColor = main
        cell.layer.cornerRadius = 15
        cell.layer.masksToBounds = false
        cell.delegate = self


        
//        if cell.success {
//            Tasks.remove(at: indexPath.row)
//            self.inboxTasksV.reloadData()
//
//        }
        
      //  cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))

        let c = Tasks[indexPath.row]
        //        print(c)

        cell._id = c._id
        cell.title.text = c.title
        cell.about.text = c.description
        cell.time.text = c.time
        cell.pesionerName.text = c.pensioner_name
        //        print(cell)
        return cell
    }

    
    
    
    
//    @objc func tap(_ sender: UITapGestureRecognizer) {
//
//        let location = sender.location(in: inboxTasksV)
//        let indexPath = inboxTasksV.indexPathForItem(at: location)
//        let cell = collectionView(inboxTasksV, cellForItemAt: indexPath!) as! NewTaskCollectionViewCell
//
//        self.task_id = cell._id
//        print(self.task_id!)
//
//
//
//
//    }
    
    
   
    

}

protocol CollectionViewCellDelegate: class {
    func showAlert(title:String, res: String)
}

