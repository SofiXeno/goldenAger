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
    
    fileprivate var baseUrl = ""
    
    init(baseUrl:String) {
        self.baseUrl = baseUrl
    }
    
    
    //MARK:- getAllCategories отримати всі категорії
    func getAllCategories(endPoint:String){
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response {
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


