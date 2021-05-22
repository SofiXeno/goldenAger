//
//  TaskCollectionViewCell.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 22.05.2021.
//

import UIKit

class TaskCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var about: UILabel!
    
    var _id:String=""
    var category_id:String=""
    
    
    
}
