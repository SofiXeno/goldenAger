//
//  DoneTasksViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 15.05.2021.
//

import UIKit



struct ArchiveTasksV {
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
    class DoneTasksViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
        @IBOutlet weak var image: UIImageView!
        
        
        private var Tasks : [ArchiveTasksV] = []
        
        @IBOutlet weak var archiveV: UICollectionView!
        
        
        override func viewDidLoad() {
            
            Reqs.get(url: "/task/completedTasks", params: nil, onSuccess: {(res: [TaskInboxV]) in
                self.image.alpha = 0
                for c in res {
                    
                    self.Tasks.append(ArchiveTasksV(title: c.template_title, time: c.template_time, description: c.template_description, pensioner_name: c.pensioner_surname + " " + c.pensioner_name))
                    
                }
                self.archiveV.dataSource = self
                self.archiveV.delegate = self
                
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "archiveTaskCell", for: indexPath) as! ArchiveTaskCollectionViewCell
            cell.layer.cornerRadius = 15
            cell.layer.masksToBounds = false
   
            let c = Tasks[indexPath.row]

            cell.title.text = c.title
            cell.about.text = c.description
            cell.name_surname.text = c.pensioner_name
            cell.time.text = c.time
  
            return cell
        }
        
    }
