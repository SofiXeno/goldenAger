//
//  TaskTemplateService.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 14.05.2021.
//

import Foundation
import Alamofire


class TaskTemplateService{
    //https://golden-ager.herokuapp.com/template
    
    fileprivate var baseUrl = ""
    
    init(baseUrl:String) {
        self.baseUrl = baseUrl
    }
    
    
    //MARK:- getAllTasks отримати всі завдання
    func getAllTasks(endPoint:String){
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response {
            DataResponse in
            guard let data = DataResponse.data else {return}
            do{
                let tasks = try JSONDecoder().decode([TaskTemplate].self,from: data)
                print("tasks == \(tasks)")
            } catch{
                print("Error decoding == \(error)")
            }
        }
    }
    
    //MARK:- getTaskFromCategory отримати всі завданняз заданої категорії
    func getTaskFromCategory(endPoint:String, categoryId: String){
        AF.request(self.baseUrl + endPoint, method: .get, parameters: ["category_id":"\(categoryId)"], encoding: URLEncoding.default, headers: nil, interceptor: nil).response {
            DataResponse in
            guard let data = DataResponse.data else {return}
            do{
                let tasks = try JSONDecoder().decode([TaskTemplate].self,from: data)
                print("tasks from category == \(tasks)")
            } catch{
                print("Error decoding == \(error)")
            }
        }
    }
    
    
    
}