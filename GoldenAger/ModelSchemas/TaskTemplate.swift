//
//  TaskTemplate.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 14.05.2021.
//

import Foundation

struct TaskTemplate: Decodable {
    
    var _id: String
    var title: String
    var description: String
    var category_id : String
    var time: String
    
    
    enum CodingKeys : String, CodingKey{
        case _id = "_id"
        case title = "title"
        case description = "description"
        case category_id = "category_id"
        case time = "time"
        
    }
    
    
}
