//
//  P_TaskArchiveViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 23.05.2021.
//

import UIKit



struct TasksArchiveP {
    var title: String
    var time: String
    var description: String
    var volunteer_name: String
    
    
    init(title: String, time: String, description: String, volunteer_name:String){
        
        self.title = title
        self.time = time
        self.description = description
        self.volunteer_name = volunteer_name
    }
    
}


class P_TaskArchiveViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var Tasks : [TasksArchiveP] = []
    
    @IBOutlet weak var archiveP: UICollectionView!
    
    @IBOutlet weak var image: UIImageView!
    
    
    override func viewDidLoad() {
        Reqs.get(url: "/task/completedTasks", params: nil, onSuccess: {(res: [ArchiveTasksP]) in
            self.image.alpha = 0
            for c in res {
                
                self.Tasks.append(TasksArchiveP(title: c.template_title, time: c.template_time, description: c.template_description, volunteer_name: c.volunteer_surname! + " " + c.volunteer_name!))
                
            }
            self.archiveP.dataSource = self
            self.archiveP.delegate = self
            
            if (self.Tasks.isEmpty){
                self.image.alpha = 1
            }
            
            print(self.Tasks)
            
        }, onFail:{res in
            
            print(res)})
        
        
        super.viewDidLoad()

    }
    
    
    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Tasks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "archiveTaskP", for: indexPath) as! ArchiveTaskCollectionViewCell
        cell.layer.cornerRadius = 15
        cell.layer.masksToBounds = false
 
        let c = Tasks[indexPath.row]
        
        cell.title.text = c.title
        cell.about.text = c.description
        cell.name_surname.text = c.volunteer_name
        cell.time.text = c.time

        return cell
    }
    
}
