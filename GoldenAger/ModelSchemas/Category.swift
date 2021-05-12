//
//  Category.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 11.05.2021.
//

import Foundation


struct Category {
    var title: String
  

    var dictionary:[String:Any] {
        return [
            "title": title]
    }

    

}

extension Category : DocumentSerializable {

    init?(dictionary: [String : Any]) {

        let title = dictionary["title"] as? String ?? "Error! Title Field Not Found!"
       
        self.init(title: title)
    }
}
