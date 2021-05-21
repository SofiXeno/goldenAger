//
//  User.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 11.05.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class UserService{
    
    
    
    let headers = ["Authorization": "Bearer token"]
    
    
    
    //https://golden-ager.herokuapp.com/users
    
    fileprivate var baseUrl = ""
    
    init(baseUrl:String) {
        self.baseUrl = baseUrl
    }
    
    
//    //MARK:- getAllUsers отримати всіх юзерів, знайти вільних волонтерів
//    func getAllUsers(endPoint:String){
//        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response {
//            DataResponse in
//            guard let data = DataResponse.data else {return}
//            do{
//
//
//                let users = try JSONDecoder().decode([User].self,from: data)
//                print("users == \(users)")
//            } catch{
//                print("Error decoding == \(error)")
//            }
//        }
//    }
    
    
    //MARK:- getUserById отримати юзера по ід
    func getUserById(userId: String){
        AF.request(self.baseUrl + "/" + userId, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response {
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
    func findFreevolunteers(){
        AF.request(self.baseUrl + "/findFreeVolunteers", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response {
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

//final class JWTAccessTokenAdapter: RequestAdapter {
//    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
//
//    }
//
//    typealias JWT = String
//    private let accessToken: JWT
//
//    init(accessToken: JWT) {
//        self.accessToken = accessToken
//    }
//
//    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
//        var urlRequest = urlRequest
//
//        if let urlString = urlRequest.url?.absoluteString, urlString.hasPrefix("https://api.authenticated.com") {
//            /// Set the Authorization header value using the access token.
//            urlRequest.setValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
//        }
//
//        return urlRequest
//    }
//}
