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
        
        editNameTF.text = plant.name
        editSpeciesTF.text = plant.species
        editWaterFrequencyTF.text = String(plant.waterFrequency)
        editWaterTimeFrameTF.text = plant.waterTimeFrame
        editSunlightDurationTF.text = String(plant.sunlightDuration)
        editSunlightTimeFrameTF.text = plant.sunlightTimeFrame
    }
    
    @IBAction func cancel(sender:Any){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        let plant = Plant(name: editNameTF.text!, species: editSpeciesTF.text!, waterFrequency: Int(editWaterFrequencyTF.text!)!, waterTimeFrame: editWaterTimeFrameTF.text!, sunlightDuration: Int(editSunlightDurationTF.text!)!, sunlightTimeFrame: editSunlightTimeFrameTF.text!)
        
        Plants.shared.edit(index: PlantListTableViewController.Global.currentCell, plant: plant)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Added Plant"), object: nil)
        self.dismiss(animated: true, completion: nil)
        
        let alertController = UIAlertController(title: "Saved", message:
            "Changes have been successfully saved.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }

}
