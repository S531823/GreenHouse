//
//  SettingsViewController.swift
//  GreenHouse
//
//  Created by student on 2/26/20.
//  Copyright © 2020 S531823. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var FromHrsTF:UITextField!
    @IBOutlet var ToHrsTF:UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func SetBusyHours(){
        let ac = UIAlertController(title: "Work In Progress" ,message: "In IOS 13 Muting notifications for certain period of time is not allowed yet.We will include it once the feature is added into IOS", preferredStyle: .alert)
                   let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                   ac.addAction(action)
                   self.present(ac,animated:true)
    }

}
