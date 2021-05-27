//
//  OrganizationViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 12.05.2021.
//

import UIKit

class OrganizationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
  

    @IBOutlet weak var organization: UIPickerView!
    
    var volonteer_registration : VolunteerRegistration?
    
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.organization.delegate = self
        self.organization.dataSource = self
        
        pickerData = ["Життєлюб", "Дім милосердя", "Молодь за мир", "Старенькі", "Suka Zhizn", "Lets Help"]
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 
        let destinationVC = segue.destination as! BirthdayViewController
        self.volonteer_registration?.organization = pickerData[organization.selectedRow(inComponent: 0)]
        destinationVC.volonteer_registration = self.volonteer_registration
        
    }
    
    override func didReceiveMemoryWarning() {
          super.didReceiveMemoryWarning()
   
      }


      func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
      }
      

      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
          return pickerData.count
      }
      
  
      func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
          return pickerData[row]
      }

}
