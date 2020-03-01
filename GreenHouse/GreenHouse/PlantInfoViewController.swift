//
//  PlantInfoViewController.swift
//  GreenHouse
//
//  Created by Student on 2/28/20.
//  Copyright © 2020 S531823. All rights reserved.
//

import UIKit

class PlantInfoViewController: UIViewController {
    
    var plant: Plant!
    
    @IBOutlet weak var editNameTF: UITextField!
    @IBOutlet weak var editSpeciesTF: UITextField!
    @IBOutlet weak var editWaterFrequencyTF: UITextField!
    @IBOutlet weak var editWaterTimeFrameTF: UITextField!
    @IBOutlet weak var editSunlightDurationTF: UITextField!
    @IBOutlet weak var editSunlightTimeFrameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if plant.name == "" { // If the plant doesn't have a name, only display species
            navigationItem.title = plant.species
        }
        else if plant.species == "" {  // If the plant doesn't have a specified species, only display name
            navigationItem.title = plant.name
        }
        else { // If the plant has both, combine both with "the" in between
            navigationItem.title = plant.name + " the " + plant.species
        }

        editNameTF.placeholder = plant.name
        editSpeciesTF.placeholder = plant.species
        editWaterFrequencyTF.placeholder = String(plant.waterFrequency)
        editWaterTimeFrameTF.placeholder = plant.waterTimeFrame
        editSunlightDurationTF.placeholder = String(plant.sunlightDuration)
        editSunlightTimeFrameTF.placeholder = plant.sunlightTimeFrame
    }
    
    @IBAction func cancel(sender:Any){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        
    }

}
