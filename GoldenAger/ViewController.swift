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
//
    override func viewDidLoad() {
        super.viewDidLoad()
            AF.request("https://golden-ager.herokuapp.com").response {
            response in
                print(response)
                print(response.response?.statusCode)
              }
              print("viewDidLoad ended")


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

