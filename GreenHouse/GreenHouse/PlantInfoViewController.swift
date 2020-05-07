//
//  PlantInfoViewController.swift
//  GreenHouse
//
//  Created by Student on 2/28/20.
//  Copyright © 2020 S531823. All rights reserved.
//

import UIKit

class PlantInfoViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {
    
    var plant: Plant!
    
    @IBOutlet weak var editNameTF: UITextField!
    @IBOutlet weak var editSpeciesTF: UITextField!
    @IBOutlet weak var editWaterFrequencyTF: UITextField!
    @IBOutlet weak var editWaterTimeFrameTF: UITextField!
    @IBOutlet weak var editSunlightDurationTF: UITextField!
    @IBOutlet weak var editSunlightTimeFrameTF: UITextField!
    @IBOutlet weak var waterTimeFramePV: UIPickerView!
    @IBOutlet weak var sunlightTimeFramePV: UIPickerView!
    
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
        //editWaterTimeFrameTF.text = plant.waterTimeFrame
        editSunlightDurationTF.text = String(plant.sunlightDuration)
        //editSunlightTimeFrameTF.text = plant.sunlightTimeFrame
        self.waterTimeFramePV.delegate = self
        self.waterTimeFramePV.dataSource = self
        self.sunlightTimeFramePV.delegate = self
        self.sunlightTimeFramePV.dataSource = self
    }
    
    let frequency = ["day", "week"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return frequency[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return frequency.count
    }
    
    var waterFreq = "day"
    var sunlightFreq = "day"
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == waterTimeFramePV{
            waterFreq = frequency[row]
        }
        else{
            sunlightFreq = frequency[row]
        }
    }
    
    @IBAction func save(_ sender: Any) {
        let oldPlant: Plant = plant
        
        if let intWaterTimeFrame = Int(editWaterFrequencyTF.text!), let intSunlightDuration = Int(editSunlightDurationTF.text!)
        {
            if PlantListTableViewController.Global.currentCell != nil {
                let plant: Plant = Plant(name: editNameTF.text!, species: editSpeciesTF.text!, waterFrequency: intWaterTimeFrame, waterTimeFrame: waterFreq, sunlightDuration: intSunlightDuration, sunlightTimeFrame: sunlightFreq)
                
                Plants.shared.edit(index: PlantListTableViewController.Global.currentCell, plant: plant)
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Added Plant"), object: nil)
                self.dismiss(animated: true, completion: nil)
                
                // Check if the fields have been changed.
                if oldPlant.name == plant.name && oldPlant.species == plant.species && oldPlant.waterFrequency == plant.waterFrequency && oldPlant.waterTimeFrame == plant.waterTimeFrame && oldPlant .sunlightDuration == plant.sunlightDuration && oldPlant.sunlightTimeFrame == plant.sunlightTimeFrame {
                    // Display pop-up alert for error message that no fields were changed
                    let alertController = UIAlertController(title: "\(editNameTF.text!)\t\(editSpeciesTF.text!)", message:
                        "No changes were made.", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
                else {
                    // Display pop-up alert for success message
                    let alertController = UIAlertController(title: "\(editNameTF.text!)\t\(editSpeciesTF.text!)Saved", message:
                        "Changes have been saved.", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
            else {
                // Display pop-up alert for error message if the app couldn't retrieve the current cell index
                let alertController = UIAlertController(title: "\(editNameTF.text!)\t\(editSpeciesTF.text!)", message:
                    "An error occured while saving changes.", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }
            
        }
        else
        {
            //alert if user enter bad data in frequency/hours text entry
            let ac = UIAlertController(title: "Invalid Entry" ,message: "Entered value should be an integer", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            ac.addAction(action)
            self.present(ac,animated:true)
        }
    }
    
}
