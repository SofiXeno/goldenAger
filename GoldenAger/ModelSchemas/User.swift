//
//  User.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 11.05.2021.
//

import Foundation


struct User: Decodable {
    var _id: Bool
    
    var is_volunteer: Bool
    
    var phone: String
    var password : String
    
    var first_name: String
    var last_name: String
    var birthday: Date
    var organization: String
    var is_free: Bool
    

    enum CodingKeys : String, CodingKey{
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
    
}

//extension User: DocumentSerializable {
//
//    init?(dictionary: [String : Any]) {
//
//        let is_volunteer = dictionary["is_volunteer"] as? Bool ?? false
//        let phone = dictionary["phone"] as? String ?? "Error! phone Field Not Found!"
//        let password = dictionary["password"] as? String ?? "Error! password Field Not Found!"
//        let first_name = dictionary["first_name"] as? String ?? "Error! first_name Field Not Found!"
//        let last_name = dictionary["last_name"] as? String ?? "Error! last_name Field Not Found!"
//
//        let birthday = dictionary["birthday"] as? Date ?? Date()
//
//        let organization = dictionary["organization"] as? String ?? "Error! organization Field Not Found!"
//
//        let is_free = dictionary["is_free"] as? Bool ?? false
//
//
//        self.init(is_volunteer: is_volunteer, phone: phone, password: password, first_name: first_name, last_name: last_name, birthday:birthday, organization:organization,is_free:is_free)
//    }

