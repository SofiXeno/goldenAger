//
//  Task.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 11.05.2021.
//

import Foundation


struct Task: Decodable {
    var _id: String
    var template_id: String
    var volunteer_id: String
    var pensioner_id: String
    var task_is_done: Bool
    

    enum CodingKeys : String, CodingKey{
        case _id = "_id"
        case template_id = "template_id"
        case volunteer_id = "volunteer_id"
        case pensioner_id = "pensioner_id"
        case task_is_done = "task_is_done"
        
    }
    
}


struct ArchiveTaskV: Decodable {
    
    
    var title: String
    var description: String
    var time: String
    var pensioner_id: String
    
    
    enum CodingKeys : String, CodingKey{
        case title = "title"
        case description = "description"
        case time = "time"
        case pensioner_id = "pensioner_id"
        
    }
    
    
}

struct ArchiveTaskP: Decodable {
    
    
    var title: String
    var description: String
    var time: String
    var volunteer_id: String
    
    
    
    
    enum CodingKeys : String, CodingKey{
        case title = "title"
        case description = "description"
        case time = "time"
        case volunteer_id = "volunteer_id"
        
    }
    
    
}

struct TaskInboxV: Decodable {
     
    
    var volunteer_id: String?
    var task_is_done: Bool
    var _id: String
    
    var pensioner_id: String
    var pensioner_name: String
    var pensioner_surname: String
    
    var template_id: String
    var template_title: String
    var template_description: String
    var template_time: String
   

    enum OuterKeys: String, CodingKey {
        case _id = "_id"
        case template_id = "template_id"
        case volunteer_id = "volunteer_id"
        case pensioner_id = "pensioner_id"
        case task_is_done = "task_is_done"
    }
    
    enum PensionerKeys: String, CodingKey {
        case _id = "_id"
        case name = "first_name"
        case surname = "last_name"
    }
    
    enum TemplateKeys: String, CodingKey {
        case _id = "_id"
        case title = "title"
        case description = "description"
        case time = "time"
    }
    

    init(from decoder: Decoder) throws {
        let outerContainer = try decoder.container(keyedBy: OuterKeys.self)
        let pensionerContainer = try outerContainer.nestedContainer(keyedBy: PensionerKeys.self,
                                                                     forKey: .pensioner_id)
        
        let templateContainer = try outerContainer.nestedContainer(keyedBy: TemplateKeys.self,
                                                                     forKey: .template_id)
        
        
        self._id = try outerContainer.decode(String.self, forKey: ._id)
        self.volunteer_id = try outerContainer.decodeIfPresent(String.self, forKey: .volunteer_id)
        self.task_is_done = try outerContainer.decode(Bool.self, forKey: .task_is_done)
        
        self.pensioner_id = try pensionerContainer.decode(String.self, forKey: ._id)
        self.pensioner_name = try pensionerContainer.decode(String.self, forKey: .name)
        self.pensioner_surname = try pensionerContainer.decode(String.self, forKey: .surname)
        
        self.template_id = try templateContainer.decode(String.self, forKey: ._id)
        self.template_title = try templateContainer.decode(String.self, forKey: .title)
        self.template_description = try templateContainer.decode(String.self, forKey: .description)
        self.template_time = try templateContainer.decode(String.self, forKey: .time)
        

    }
    
    
}



struct ArchiveTasksP: Decodable {

    
    var pensioner_id: String
    var task_is_done: Bool
    var _id: String
    
    var volunteer_id: String?
    var volunteer_name: String?
    var volunteer_surname: String?
    
    var template_id: String
    var template_title: String
    var template_description: String
    var template_time: String
   

    enum OuterKeys: String, CodingKey {
        case _id = "_id"
        case template_id = "template_id"
        case volunteer_id = "volunteer_id"
        case pensioner_id = "pensioner_id"
        case task_is_done = "task_is_done"
    }
    
    enum VolunteerKeys: String, CodingKey {
        case _id = "_id"
        case name = "first_name"
        case surname = "last_name"
    }
    
    enum TemplateKeys: String, CodingKey {
        case _id = "_id"
        case title = "title"
        case description = "description"
        case time = "time"
    }
    

    init(from decoder: Decoder) throws {
        
        let outerContainer = try decoder.container(keyedBy: OuterKeys.self)
        
        
     
        
        if outerContainer.contains(.volunteer_id) {
            
        let volunteerContainer = try? outerContainer.nestedContainer(keyedBy: VolunteerKeys.self,forKey: .volunteer_id)
            
        self.volunteer_id = try volunteerContainer?.decodeIfPresent(String.self, forKey: ._id)
        self.volunteer_name = try volunteerContainer?.decodeIfPresent(String.self, forKey: .name)
        self.volunteer_surname = try volunteerContainer?.decodeIfPresent(String.self, forKey: .surname)
        }
        else{
            
            volunteer_id = nil
        }
        
        let templateContainer = try outerContainer.nestedContainer(keyedBy: TemplateKeys.self,
                                                                     forKey: .template_id)
        
        self._id = try outerContainer.decode(String.self, forKey: ._id)
        self.pensioner_id = try outerContainer.decode(String.self, forKey: .pensioner_id)
        self.task_is_done = try outerContainer.decode(Bool.self, forKey: .task_is_done)
    
        self.template_id = try templateContainer.decode(String.self, forKey: ._id)
        self.template_title = try templateContainer.decode(String.self, forKey: .title)
        self.template_description = try templateContainer.decode(String.self, forKey: .description)
        self.template_time = try templateContainer.decode(String.self, forKey: .time)
    
    }
    
    
}


struct MyVolunteer: Decodable {

    var volunteer: String?
    
    var _id: String?
    var is_volunteer: Bool?
    var phone: String?
    var password : String?
    var first_name: String?
    var last_name: String?
    var birthday: Date?
    var organization: String?
    var is_free: Bool?
   

    enum OuterKeys: String, CodingKey {
       
        case volunteer = "volunteer"
      
    }
    
    enum VolunteerKeys: String, CodingKey {
        case _id = "_id"
        case is_volunteer = "is_volunteer"
        case phone = "phone"
        case password = "password"
        case first_name = "first_name"
        case last_name = "last_name"
        case birthday = "birthday"
        case organization = "organization"
        case is_free = "is_free"
    }
    
    init(from decoder: Decoder) throws {
        let outerContainer = try decoder.container(keyedBy: OuterKeys.self)
        
        if outerContainer.contains(.volunteer) {
        
        let volunteerContainer = try? outerContainer.nestedContainer(keyedBy: VolunteerKeys.self,
                                                                     forKey: .volunteer)
     
    
            self._id = try volunteerContainer?.decodeIfPresent(String.self, forKey: ._id)
            self.is_volunteer = try volunteerContainer?.decodeIfPresent(Bool.self, forKey: .is_volunteer)
            self.phone = try volunteerContainer?.decodeIfPresent(String.self, forKey: .phone)
            self.password = try volunteerContainer?.decodeIfPresent(String.self, forKey: .password)
            self.first_name = try volunteerContainer?.decodeIfPresent(String.self, forKey: .first_name)
            self.last_name = try volunteerContainer?.decodeIfPresent(String.self, forKey: .last_name)
            self.birthday = try volunteerContainer?.decodeIfPresent(Date.self, forKey: .birthday)
            self.organization = try volunteerContainer?.decodeIfPresent(String.self, forKey: .organization)
            self.is_free = try volunteerContainer?.decodeIfPresent(Bool.self, forKey: .is_free)
        
        }else{
            
            volunteer = nil
        }
        
    }
    
    
}



