//
//  ViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 09.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let server = "https://arcane-sands-45523.herokuapp.com"
  
    @IBOutlet weak var serverResponseLabel: UILabel!
    
//    @IBOutlet weak var email: UITextField!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.email.frame.height))
//        email.leftView = paddingView
//        email.leftViewMode = UITextField.ViewMode.always
//
//
//    }

    @IBAction func sendRequestButtonTappled(_ sender: UIButton) {
        
        
        guard let url  = URL(string: server) else {return}
                // background task to make request with URLSession
                let task = URLSession.shared.dataTask(with: url) {
                    (data, response, error) in
                    if let error = error {
                        print(error)
                        return
                    }
                    guard let data = data else {return}
                    guard let dataString = String(data: data, encoding: String.Encoding.utf8) else {return}
                    // update the UI if all went OK
                    DispatchQueue.main.async {
                        self.serverResponseLabel.text = dataString
                    }
                }
                // start the task
                task.resume()
        
        
        
    }
    
    
    
    
    
}

