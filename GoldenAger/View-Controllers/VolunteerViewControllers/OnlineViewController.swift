//
//  OnlineViewController.swift
//  GoldenAger
//
//  Created by Софія Ксенофонтова  on 15.05.2021.
//

import UIKit
import CSS3ColorsSwift
import Hue

class OnlineViewController: UIViewController {

    @IBOutlet weak var online: UISwitch!
    @IBOutlet weak var text1: UILabel!
    
    @IBOutlet weak var text2: UILabel!
    
    let main = UIColor(hex: "#BFE0E0")
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func switched(_ sender: Any) {
        changeBackground()
    }
    
    func changeBackground() {
        if online.isOn {
            self.view.backgroundColor = .paleGreen
            text1.text = "Ти онлайн !"
            text1.textAlignment = .center
            text2.text="Переключи тумблер, провівши справа наліво, щоб перейти в режим офлайн"
            return
        }
        else
        {
            self.view.backgroundColor = main
            text1.text = "Вийти в онлайн?"
            text2.text="Переключи тумблер, провівши зліва направо, щоб перейти в режим онлайн"
            return
        }
    }

}
