//
//  Category.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 11.05.2021.
//

import Foundation


struct Category: Decodable {
    var _id: String
    var title: String
  

    enum CodingKeys : String, CodingKey{
        case _id = "_id"
        case title = "title"
        
    }
    


}

//extension Category : DocumentSerializable {
//
//    init?(dictionary: [String : Any]) {
//
//        let title = dictionary["title"] as? String ?? "Error! Title Field Not Found!"
//
//        self.init(title: title)
//    }

