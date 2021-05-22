//
//  TasksViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 14.05.2021.
//

import UIKit



struct TaskSample {
    var _id:String=""
    
    var category_id:String=""
    var description:String = ""
    var title:String = ""
    var time:String=""
    
    init(_id:String, description:String, title:String, time:String,category_id:String){
        self._id = _id
        self.title = title
        self.description = description
        self.category_id = category_id
        self.time = time
    }
}

class TasksViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    var task_label:String?
    
    var _id: String?
    
    @IBOutlet weak var tasks: UICollectionView!
    
    private var Tasks : [TaskSample] = []
    
    override func viewDidLoad() {
   
        
        Reqs.get(url: "/template/getByCategory/" + _id!, params: nil, onSuccess: {(res: [TaskTemplate]) in
            
            for c in res {
                
                self.Tasks.append(TaskSample(_id: c._id, description: c.description, title: c.title, time: c.time, category_id: c.category_id))
                
            }
            self.tasks.dataSource = self
            self.tasks.delegate = self
            //         print(self.Tasks)
            
        }, onFail:{res in print(res)})
        
        super.viewDidLoad()
        
        
    }
    
    
//        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//
//
//            self.performSegue(withIdentifier: "task_detailed", sender: self)
//    //
//    //        let destinationVC = segue.destination as! SelectViewController
//    //
//    //        destinationVC.text =  Tasks[indexPath.row].title
//
//
//
//
//
//            }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Create a variable to store the name the user entered on textField
        
        
        let destinationVC = segue.destination as! SelectViewController
        destinationVC.text = self.task_label
        
        
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "taskCell", for: indexPath) as! TaskCollectionViewCell
        cell.layer.cornerRadius = 15
        cell.layer.masksToBounds = false
        
        // Configure the cell
        
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
        
        let c = Tasks[indexPath.row]
        //        print(c)
        cell.name.text = c.title
        cell.about.text = c.description
        cell.time.text = c.time
        cell._id = c._id
        //        print(cell)
        return cell
    }
    
    
    
    
    @objc func tap(_ sender: UITapGestureRecognizer) {
        
        let location = sender.location(in: tasks)
        let indexPath = tasks.indexPathForItem(at: location)
        let cell = collectionView(tasks, cellForItemAt: indexPath!) as! TaskCollectionViewCell
        
        self.task_label = cell.name.text
        
        
        //
        
        //        let destinationVC =  SelectViewController()
        //
        //        destinationVC.text =  cell.name.text
        //
        //
        //        print(destinationVC.text!)
        
//        print(task_label)
        
        self.performSegue(withIdentifier: "task_detailed", sender: self)
        
        //        let nvc = navigationController?.pushViewController(selectVC, animated: true)
        
        
        
    }
}
