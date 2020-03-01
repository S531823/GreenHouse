//
//  AddPlantViewController.swift
//  GreenHouse
//
//  Created by student on 2/25/20.
//  Copyright © 2020 S531823. All rights reserved.
//

import UIKit

class AddPlantViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var speciesTF: UITextField!
    @IBOutlet weak var waterTimesTF: UITextField!
    @IBOutlet weak var waterPeriodTF: UITextField!
    @IBOutlet weak var sunlightTimesTF: UITextField!
    @IBOutlet weak var sunlightPeriodTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addPlant(sender:Any){
        let name = nameTF.text!
        let species = speciesTF.text!
        let waterPeriod = waterPeriodTF.text!
        let sunlightPeriod = sunlightPeriodTF.text!
        
        if let waterTimes = Int(waterTimesTF.text!) {
            if let sunlightTimes = Int(sunlightTimesTF.text!) {
                let plant = Plant(name: name, species: species, waterFrequency: waterTimes, waterTimeFrame: waterPeriod, sunlightFrequency: sunlightTimes, sunlightTimeFrame: sunlightPeriod)
                Plants.shared.add(plant: plant)
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Added Plant"), object: nil)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func cancel(sender:Any){
        self.dismiss(animated: true, completion: nil)
    }
    
}
