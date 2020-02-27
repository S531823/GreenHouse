//
//  AddPlantViewController.swift
//  GreenHouse
//
//  Created by student on 2/25/20.
//  Copyright © 2020 S531823. All rights reserved.
//

import UIKit

class AddPlantViewController: UIViewController {

    @IBOutlet weak var nameTF:UITextField!
    @IBOutlet weak var speciesTF:UITextField!
    @IBOutlet weak var waterTimesTF:UITextField!
    @IBOutlet weak var waterPeriodTF:UITextField!
    @IBOutlet weak var sunlightTimesTF:UITextField!
    @IBOutlet weak var sunlightPeriodTF:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addPlant(sender:Any){
        let name = nameTF.text!
        let species = speciesTF.text!
        let waterTimes = waterTimesTF.text!
        let waterPeriod = waterPeriodTF.text!
        let sunlightTimes = sunlightTimesTF.text!
        let sunlightPeriod = sunlightPeriodTF.text!
        
        let waterFrequency = [Int(waterTimes)!:waterPeriod]
        let sunlightFrequency = [Int(sunlightTimes)!:sunlightPeriod]
        
        let plant = Plant(name: name, species: species, waterFrequency: waterFrequency,
                          sunlightFrequency: sunlightFrequency)
        Plants.shared.add(plant: plant)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(sender:Any){
        self.dismiss(animated: true, completion: nil)
    }
    
}
