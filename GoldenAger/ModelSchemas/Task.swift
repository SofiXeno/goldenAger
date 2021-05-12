//
//  Task.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 11.05.2021.
//

import Foundation


struct Task {
    var title: String
    var description: String
    var category_id : String
    var time: String
    
    var volunteer_id: String
    var pensioner_id: String
    var task_is_done: Bool
    

    var dictionary:[String:Any] {
        return [
            "title": title,
            "description": description,
            "category_id": category_id,
            "time": time,
            "volunteer_id": volunteer_id,
            "pensioner_id": pensioner_id,
            "task_is_done": task_is_done
        ]
    }
}

extension Task : DocumentSerializable {

    init?(dictionary: [String : Any]) {

        let title = dictionary["title"] as? String ?? "Error! Title Field Not Found!"
        let description = dictionary["description"] as? String ?? "Error! Description Field Not Found!"
        let category_id = dictionary["category_id"] as? String ?? "Error! category_id Field Not Found!"
        let time = dictionary["time"] as? String ?? "Error! time Field Not Found!"
        let volunteer_id = dictionary["volunteer_id"] as? String ?? "Error! volunteer_id Field Not Found!"

        let pensioner_id = dictionary["pensioner_id"] as? String ?? "Error! pensioner_id Field Not Found!"
        
        let task_is_done = dictionary["task_is_done"] as? Bool ?? false
        
        
        self.init(title: title, description: description, category_id: category_id, time: time, volunteer_id: volunteer_id, pensioner_id:pensioner_id, task_is_done:task_is_done)
    }
}
