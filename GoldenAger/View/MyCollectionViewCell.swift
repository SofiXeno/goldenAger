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





    
    
 
    

      

    
    

