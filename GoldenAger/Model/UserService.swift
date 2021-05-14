//
//  User.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 11.05.2021.
//

import Foundation
import Alamofire

class UserService{
    //https://golden-ager.herokuapp.com/users
    
    fileprivate var baseUrl = ""
    
    init(baseUrl:String) {
        self.baseUrl = baseUrl
    }
    
    
    //MARK:- getAllUsers отримати всіх юзерів
    func getAllUsers(endPoint:String){
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response {
            DataResponse in
            guard let data = DataResponse.data else {return}
            do{
                
                
                let users = try JSONDecoder().decode([User].self,from: data)
                print("users == \(users)")
            } catch{
                print("Error decoding == \(error)")
            }
        }
    }
    
    
    //MARK:- getUserById отримати юзера по ід
    func getUserById(endPoint:String, userId: String){
        AF.request(self.baseUrl + endPoint + userId, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response {
            DataResponse in
            guard let data = DataResponse.data else {return}
            do{
                self.decodeDate()
                let user = try JSONDecoder().decode([User].self,from: data)
                print("user by id == \(user)")
            } catch{
                print("Error decoding == \(error)")
            }
        }
    }
    
    
    //MARK:- findFreevolunteers знайти вільних волонтерів
    func findFreevolunteers(endPoint:String){
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response {
            DataResponse in
            guard let data = DataResponse.data else {return}
            do{
                self.decodeDate()
                let volunteers = try JSONDecoder().decode([User].self,from: data)
                print("free volunteers == \(volunteers)")
            } catch{
                print("Error decoding == \(error)")
            }
        }
    }
    
    func decodeDate(){
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'00:00:00.000+00:00"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
    }
    
    
 
    
    
}


