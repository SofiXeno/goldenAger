//
//  Category.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 11.05.2021.
//

import Foundation

import Alamofire

class CategoryService{
    //https://golden-ager.herokuapp.com/category
    
    fileprivate var baseUrl:String
    
    init(baseUrl:String) {
        self.baseUrl = baseUrl
    }
    
    
    //MARK:- getAllCategories отримати всі категорії
    func getAllCategories(){
        AF.request(self.baseUrl + "/", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response {
            DataResponse in
            guard let data = DataResponse.data else {return}
            do{
                let categories = try JSONDecoder().decode([Category].self,from: data)
                print("categories== \(categories)")
            } catch{
                print("Error decoding == \(error)")
            }
        }
    }
}


