//
//  User.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 11.05.2021.
//

import Foundation
import UIKit


struct PensionerRegistration {
    var is_volunteer: Bool = false
    var name: String?
    var surname: String?
    var birthday: Date?
    var phone: String?
    var password: String?
    
}



struct PensionerLogin {
    var phone: String?
    var password: String?
    
}


struct VolunteerRegistration {
    var is_volunteer: Bool = true
    var name: String?
    var surname: String?
    var birthday: Date?
    var phone: String?
    var organization: String?
    var password: String?
    
}


struct VolunteerLogin {
    var phone: String?
    var password: String?
    
}


protocol DocumentSerializable {
    init?(dictionary:[String:Any])
}

struct UserV: Decodable {
    var _id: String
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

struct UserP: Decodable {
    var _id: String
    var is_volunteer: Bool
    var phone: String
    var password : String
    var first_name: String
    var last_name: String
    var birthday: Date
  
    

    enum CodingKeys : String, CodingKey{
        case _id = "_id"
        case is_volunteer = "is_volunteer"
        case phone = "phone"
        case password = "password"
        case first_name = "first_name"
        case last_name = "last_name"
        case birthday = "birthday"
     
   


    }
    
}


struct Token: Codable {
    var token: String
    
    enum CodingKeys : String, CodingKey{
        case token = "token"
        
    }
    
}


//struct LoginData {
//    var phone: String
//    var password: String
//}


//struct RegisterData {
//    var phone: String
//    var password: String
//    var first_name: String
//    var last_name: String
//    var birthday: Date
//    var organization: String,
//    var is_volunterr: Bool
//}

//extension User{
//    public init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        _id = try container.decode(String.self, forKey: ._id)
//        is_volunteer = try container.decode(Bool.self, forKey: .is_volunteer)
//        phone = try container.decode(String.self, forKey: .phone)
//        password = try container.decode(String.self, forKey: .password)
//        first_name = try container.decode(String.self, forKey: .first_name)
//        last_name = try container.decode(String.self, forKey: .last_name)
//
//        birthday = try Formatter.custom.date(from: container.decode(String.self, forKey: .birthday))!
//        organization = try container.decode(String.self, forKey: .organization)
//        is_free = try container.decode(Bool.self, forKey: .is_free)
//
//    }
//}
//
//extension Formatter {
//    static let custom: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.ZZZ+ZZ:ZZ"
//        return formatter
//    }()
//}

extension UserV: DocumentSerializable {

    init?(dictionary: [String : Any]) {

        
        let _id = dictionary["_id"] as? String ?? "Error! _id Field Not Found!"
        let is_volunteer = dictionary["is_volunteer"] as? Bool ?? false
        let phone = dictionary["phone"] as? String ?? "Error! phone Field Not Found!"
        let password = dictionary["password"] as? String ?? "Error! password Field Not Found!"
        let first_name = dictionary["first_name"] as? String ?? "Error! first_name Field Not Found!"
        let last_name = dictionary["last_name"] as? String ?? "Error! last_name Field Not Found!"

        let birthday = dictionary["birthday"] as? Date ?? Date()

        let organization = dictionary["organization"] as? String ?? "Error! organization Field Not Found!"

        let is_free = dictionary["is_free"] as? Bool ?? false


        self.init(_id: _id, is_volunteer: is_volunteer, phone: phone, password: password, first_name: first_name, last_name: last_name, birthday:birthday, organization:organization,is_free:is_free)
    }

}

extension UserP: DocumentSerializable {

    init?(dictionary: [String : Any]) {

        
        let _id = dictionary["_id"] as? String ?? "Error! _id Field Not Found!"
        let is_volunteer = dictionary["is_volunteer"] as? Bool ?? false
        let phone = dictionary["phone"] as? String ?? "Error! phone Field Not Found!"
        let password = dictionary["password"] as? String ?? "Error! password Field Not Found!"
        let first_name = dictionary["first_name"] as? String ?? "Error! first_name Field Not Found!"
        let last_name = dictionary["last_name"] as? String ?? "Error! last_name Field Not Found!"

        let birthday = dictionary["birthday"] as? Date ?? Date()

       


        self.init(_id: _id, is_volunteer: is_volunteer, phone: phone, password: password, first_name: first_name, last_name: last_name, birthday:birthday)
    }

}
