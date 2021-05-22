//
//  Category.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 11.05.2021.
//

import Foundation
// data:Category
// data.ert

struct Category: Decodable, Encodable {
    var _id: String
    var title: String
    var image:String
  

    enum CodingKeys : String, CodingKey{
        case _id = "_id"
        case title = "title"
        case image = "image"
        
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

