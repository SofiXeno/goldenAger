//
//  Category.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 11.05.2021.
//

import Foundation

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

