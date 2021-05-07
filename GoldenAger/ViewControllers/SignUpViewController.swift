//
//  SignUpViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 06.05.2021.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var surname: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var repeatPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func createAccountButton(_ sender: Any) {
        if (name.text?.isEmpty) == true || (surname.text?.isEmpty) == true || (email.text?.isEmpty) == true || phone.text?.isEmpty == true  {
            print("Всі поля мають бути заповнені")
            return
        }
        
        signUp()
    }
    
    
    // MARK: - Navigation

    func signUp(){
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) {(authResult, error) in
        
                                guard let user = authResult?.user, error == nil else {
                                    print("Error \(error?.localizedDescription)")
                                    return
                                }
        
            
            
            
                                }
        
        
        
    }

}
