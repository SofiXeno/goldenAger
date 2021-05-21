//
//  Auth.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 01.05.2021.
//

import Foundation
import Alamofire
import SwiftyJSON
import KeychainSwift


class AuthService {
    
    let defaults = UserDefaults.standard
    
    func createUser(endPoint:String){
        
        var headers: HTTPHeaders = [:]
        
        //        if let authorizationHeader = Request.authorizationHeader(user: user, password: password) {
        //            headers[authorizationHeader.key] = authorizationHeader.value
        //        }
        
        AF.request(
            "http://golden-ager.herokuapp.com/auth/registration" + endPoint,
            method: .post,
            parameters: nil,
            encoding: URLEncoding.default,
            headers:["Authorization": "Bearer: "])
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    let name = json["name"].stringValue
                    print(name)
                    print("Validation Successful")
                case .failure(let error):
                    print(error)
                }
            }
        
        

    }
    
    struct LoginResponse {
        var token:String
    }
    
    func login(phone:String, password:String) {
        AF.request(Config.SERVER_URL + "/auth/login", method: .post, parameters: ["phone":phone, "password":password], encoding: JSONEncoding.default, headers: nil, interceptor: nil)
            .responseJSON {
                response in
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    print(json["token"])
                case.failure(let err) :
                    print(err)
                    
                }
                
    }
    
}
}
