//
//  CategoriesViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 13.05.2021.
//

import UIKit
import CSS3ColorsSwift

struct Cell {
    var _id:String=""
    var image:String = ""
    var name:String = ""
    
    init(_id:String, image: String, name: String){
        self._id = _id
        self.image = image
        self.name = name
    }
}


class CategoriesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var pensioner_registration : PensionerRegistration?
    var pensioner_login : PensionerLogin?

    @IBOutlet weak var categories: UICollectionView!
    private var cells: [Cell] = []
    
    var category_id:String?
    
    override func viewDidLoad() {
    
        
       Reqs.get(url: "/category", params: nil, onSuccess: {(res: [Category]) in
        
        for c in res {
            
            self.cells.append(Cell(_id: c._id, image: c.image, name: c.title))
           
        }
        self.categories.dataSource = self
        self.categories.delegate = self

        
       }, onFail:{res in print(res)})
        
        super.viewDidLoad()
   
    }
    
    
    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dataCell", for: indexPath) as! MyCollectionViewCell
        cell.layer.cornerRadius = 15
        cell.layer.masksToBounds = false
        

        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap(_:))))
        
        let c = cells[indexPath.row]

        cell.image.image = UIImage(named: c.image)
        cell.label.text = c.name
        cell._id = c._id

        return cell
    }
    
   
    @objc func tap(_ sender: UITapGestureRecognizer) {
        
        let location = sender.location(in: categories)
        let indexPath = categories.indexPathForItem(at: location)
        let cell = collectionView(categories, cellForItemAt: indexPath!) as! MyCollectionViewCell
        
        self.category_id = cell._id
    
        if (cells[indexPath!.row].name == "Консультація"){
           
            self.performSegue(withIdentifier: "consultation_segue", sender: self)}
        else{
            

            self.performSegue(withIdentifier: "tasks_segue", sender: self)
            
            
        }
        
    }
  

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        
        if (segue.identifier=="consultation_segue"){
        
            let consultViewController: ConsultationViewController = ConsultationViewController()

        }
        else if (segue.identifier=="tasks_segue"){
        
            let destinationVC = segue.destination as! TasksViewController
            destinationVC._id = self.category_id
   
        }



    }
    
}







