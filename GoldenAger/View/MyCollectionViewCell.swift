//
//  MyCollectionViewCell.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 13.05.2021.
//

import UIKit


class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    var _id : String = ""
    
    override var isSelected: Bool {
        didSet {
            
            alpha = isSelected ? 0.5 : 1.0
          
        }
      
    }
    
}

//    override var isSelected: Bool{
//      didSet{
//        let categoriesVC: CategoriesViewController = CategoriesViewController()
//        if self.isSelected
//        {
//            if (self.label.text == "Консультація"){
//                let consultViewController: ConsultationViewController = ConsultationViewController()
//
//                categoriesVC.present(consultViewController, animated: true, completion: nil)
//
//            }
//            else{
//
//                let taskViewController: TasksViewController = TasksViewController()
//
//                        categoriesVC.present(taskViewController, animated: true, completion: nil)
//
//
//            }
//        }
//        else
//        {
//
//        }
//      }




    
    
 
    

      

    
    

