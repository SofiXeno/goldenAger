//
//  RequestFactory.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 03.05.2021.


import Alamofire
import Foundation
import SwiftyJSON
import KeychainSwift

struct MessageResponse : Codable  {
    
    var message: String
    
    enum CodingKeys : String, CodingKey{
        case message = "message"
        
    }
}


class Reqs {
    
    static let keychain = KeychainSwift()
    static let decoder = DateHelpers.createCustomDecoder()
    
    private static func createHeaders() -> HTTPHeaders? {
        if let token = keychain.get("token") {
        return ["Authorization" : "Bearer " + token]
        }else {return nil}
    }
    
    
    
    private static func req<T:Decodable>(url:String, params:[String : Any]?,
                            method:HTTPMethod,
                            encoding:ParameterEncoding,
                            onSuccess:@escaping (T) -> Void,
                            onFail: @escaping (MessageResponse) -> Void) {
        AF.request(Config.SERVER_URL + url,
                   method: method,
                   parameters: params,
                   encoding: encoding,
                   headers: createHeaders(),
                   interceptor: nil)
            .responseJSON {response in
                if let status = response.response?.statusCode  {
                    if 200..<300 ~= status {
                        var res: T
                        do{
                        res = try decoder.decode(T.self, from: response.data!)
                        }
                        catch {
                            print(error)
                            return
                        }
                        onSuccess(res)
                    } else {
                        var res: MessageResponse
                        do{
                        res = try decoder.decode(MessageResponse.self, from: response.data!)
                        }
                        catch {
                            print(error)
                            return
                        }
                        onFail(res)
                    }
                }
            }
    }

    
    static func get<T:Decodable>(url:String,
                    params:[String : Any]?,
                    onSuccess: @escaping (T) -> Void,
                    onFail: @escaping (MessageResponse) -> Void) {
        self.req(url:url, params:params, method:.get, encoding:URLEncoding.default, onSuccess:onSuccess, onFail:onFail)
    }
    
    static func post<T:Decodable>(url:String,
                     params:[String : Any]?,
                     onSuccess: @escaping (T) -> Void,
                     onFail: @escaping (MessageResponse) -> Void) {
        self.req(url:url, params:params, method:.post, encoding:JSONEncoding.default, onSuccess:onSuccess, onFail:onFail)
    }
}
