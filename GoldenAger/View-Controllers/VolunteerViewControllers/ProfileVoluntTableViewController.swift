//
//  ProfileVoluntTableViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 22.05.2021.
//

import UIKit

class ProfileVoluntTableViewController: UITableViewController {
    @IBOutlet weak var name_surname: UILabel!
    
    @IBOutlet weak var organization: UILabel!

    
    @IBOutlet weak var birthday: UILabel!
    
    @IBOutlet weak var phone: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Reqs.get(url: "/users/current", params: nil, onSuccess: {(res: UserV) in
         
            
            print(res)
            self.name_surname.text = res.last_name + " " + res.first_name
            self.organization.text = "«" + res.organization + "»"
            self.phone.text = res.phone
            self.birthday.text = DateHelpers.dateToServerString(date: res.birthday)

            
         
        }, onFail:{res in print(res)})
    }

  
    
    
    @IBAction func logOut(_ sender: UIButton) {
        
        
        let refreshAlert = UIAlertController(title: "Вихід", message: "Ви впевнені що хочете вийти?", preferredStyle: .alert)

        refreshAlert.addAction(UIAlertAction(title: "Так", style: .default, handler: { (action: UIAlertAction!) in
            let story = UIStoryboard(name: "Main", bundle: nil)
                 let controller = story.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
                 self.present(controller, animated: true, completion: nil)
        }))

        refreshAlert.addAction(UIAlertAction(title: "Ні", style: .cancel, handler: { (action: UIAlertAction!) in
            refreshAlert.dismiss(animated: true, completion: nil)
        }))

        present(refreshAlert, animated: true, completion: nil)
        
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
 
     
        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
