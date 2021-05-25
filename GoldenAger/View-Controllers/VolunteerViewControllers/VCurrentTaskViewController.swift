//
//  VCurrentTaskViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 24.05.2021.
//

import UIKit



struct CurrentTaskV {
    var title: String
    var time: String
    var description: String
    var pensioner_name: String
    
    
    init(title: String, time: String, description: String, pensioner_name:String){
        
        self.title = title
        self.time = time
        self.description = description
        self.pensioner_name = pensioner_name
    }
    
}

class VCurrentTaskViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    @IBOutlet weak var currentTaskV: UICollectionView!
    
    @IBOutlet weak var currentTaskInfoV: UILabel!
    
    var task_title : String=""
    var task_about : String=""
    var task_time : String=""
    var pensioner_name : String=""
    
    
    override func viewDidLoad() {
        
        
        Reqs.get(url: "/task/currentTask", params: nil, onSuccess: {(res: TaskInboxV) in
            self.currentTaskInfoV.text=""
            
            self.task_title=res.template_title
            self.task_about = res.template_description
            self.task_time = res.template_time
            self.pensioner_name = res.pensioner_surname + " " + res.pensioner_name
            
            print(res)
            
            
            self.currentTaskV.dataSource = self
            self.currentTaskV.delegate = self
            
        }, onFail:{res in
            
            self.currentTaskInfoV.text = "У Вас немає поточних завдань"
            
            print(res)
            
        })
        
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "currentTaskVCell", for: indexPath) as! ArchiveTaskCollectionViewCell
        
        cell.layer.cornerRadius = 15
        cell.layer.masksToBounds = false
        
        
        cell.title.text = self.task_title
        cell.about.text = self.task_about
        cell.name_surname.text = self.pensioner_name
        cell.time.text = self.task_time
        
        return cell
    }
    
    
}
