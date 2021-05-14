//
//  CategoriesViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 13.05.2021.
//

import UIKit
import CSS3ColorsSwift


private let reuseIdentifier = "Cell"

struct Cell {
    var image:String = ""
    var name:String = ""
    
    init(image: String, name: String){
        self.image = image
        self.name = name
    }
}


class CategoriesViewControнller: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var categories: UICollectionView!
    
    private var cells: [Cell] = [Cell(image: "hospital_board", name: "Здоров'я"),Cell(image: "accounting_calculator", name: "Рахунки"),
                                 Cell(image: "delivery_person_motorcycle", name: "Доставка"),
                                 Cell(image: "real estate favorite hold house", name: "Хатня робота"),Cell(image: "real estate settings house wrench", name: "Ремонт"),
                                 Cell(image: "question circle", name: "Консультація")]
    
    
    
    //    @IBOutlet weak var categories: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.categories.dataSource = self
        self.categories.delegate = self
        
        
        
        
        let service = CategoryService(baseUrl: "https://golden-ager.herokuapp.com/category")
        service.getAllCategories(endPoint: "/")
        
        
    }
    
    
    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dataCell", for: indexPath) as! MyCollectionViewCell
        cell.layer.cornerRadius = 15
        cell.layer.masksToBounds = false
        
        // Configure the cell
        
        let c = cells[indexPath.row]
        cell.image.image = UIImage(named: c.image)
        cell.label.text = c.name
        
        return cell
    }
    
    
    //
    //    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    //           let  size = collectionView.frame.size.width / CGFloat(2) - CGFloat((2 - 1)) * 26
    //           return CGSize(width: size, height: size)
    //       }
    
    
}



//extension CategoriesViewController: UICollectionViewDelegateFlowLayout{
//    
//    
//}




