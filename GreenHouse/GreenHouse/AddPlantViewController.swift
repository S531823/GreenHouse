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
    @IBOutlet weak var waterFrequencyTF: UITextField!
    @IBOutlet weak var waterTimeFrameTF: UITextField!
    @IBOutlet weak var sunlightDurationTF: UITextField!
    @IBOutlet weak var sunlightTimeFrameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addPlant(sender:Any){
        if Int(waterFrequencyTF.text!) != nil && waterTimeFrameTF.text != nil && Int(sunlightDurationTF.text!) != nil && sunlightTimeFrameTF.text != nil {
            let plant = Plant(name: nameTF.text!, species: speciesTF.text!, waterFrequency: Int(waterFrequencyTF.text!)!, waterTimeFrame: waterTimeFrameTF.text!, sunlightDuration: Int(sunlightDurationTF.text!)!, sunlightTimeFrame: sunlightTimeFrameTF.text!)
            Plants.shared.add(plant: plant)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Added Plant"), object: nil)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancel(sender:Any){
        self.dismiss(animated: true, completion: nil)
    }
    
}
