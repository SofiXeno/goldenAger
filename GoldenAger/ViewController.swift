//
//  ViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 09.04.2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let server = "https://golden-ager.herokuapp.com"
  
//    @IBOutlet weak var serverResponseLabel: UILabel!
    
//    @IBOutlet weak var email: UITextField!
//b
    override func viewDidLoad() {
        super.viewDidLoad()
//        let params = ["60992b68e4a13c001554b74b",true,true]
        
//   Reqs.get(url: "/category", params: nil, onSuccess: {(res: [Category]) in print(res)}, onFail:{res in print(res)})
        
        Reqs.get(url: "/template/getByCategory/609690d67cb3785fc858cc83", params: nil, onSuccess: {(res: [TaskTemplate]) in
            print(res)
         
        }, onFail:{res in print(res)})
//
//        Reqs.get(url: "/users/60993ca76b6378a974d36dea", params: nil, onSuccess: {(res: [User]) in print(res)}, onFail:{res in print(res)})
        
//        Reqs.post(url:"/auth/login",
//                              params:["phone":"380984575989", "password":"qwerty"],
//                              onSuccess: {
//                                (res: Token) in print(res.token)
//                              },
//                                onFail: {
//                                    res in print(res)
//
//                                })
//
//        Reqs.post(url:"/auth/registration",
//                  params:["first_name" : "vasya",
//                          "last_name":"vaskin",
//                          "birthday": DateHelpers.dateToServerString(date: Date()),
//                          "is_volunteer": "false",
//                          "phone" : "380501232233",
//                          "password" : "12345678"
//                  ],
//        onSuccess:{ (res : MessageResponse) in print(res)},
//        onFail: {(res : MessageResponse) in print(res)})
        
//        var times = 0
//        let timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { timer in
//            Reqs.get(url: "/users/60993ca76b6378a974d36dea", params: nil, onSuccess: {(res: [User]) in print(res)}, onFail:{res in print(res)})
//            times += 1
//            if(times == 3) {
//                print("end")
//                timer.invalidate()
//            }
//        }

    }
    
   
//    @IBAction func sendRequestButtonTappled(_ sender: UIButton) {
//
//
//        guard let url  = URL(string: server) else {return}
//                // background task to make request with URLSession
//                let task = URLSession.shared.dataTask(with: url) {
//                    (data, response, error) in
//                    if let error = error {
//                        print(error)
//                        return
//                    }
//                    guard let data = data else {return}
//                    guard let dataString = String(data: data, encoding: String.Encoding.utf8) else {return}
//                    // update the UI if all went OK
//                    DispatchQueue.main.async {
//                        self.serverResponseLabel.text = dataString
//                    }
//                }
//                // start the task
//                task.resume()
//
//
//
//    }
//
//
    
    
    
}

