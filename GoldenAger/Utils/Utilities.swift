//
//  Utilities.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 11.05.2021.
//

import Foundation
import UIKit


//protocol DocumentSerializable {
//    init?(dictionary:[String:Any])
//}


class Utilities {
    
    
 static func paddingTextField(_ textfield:UITextField) {
    
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textfield.frame.height))

    textfield.leftView = paddingView
    textfield.leftViewMode = UITextField.ViewMode.always
    
     }
    
    
    
    
    

    
}
