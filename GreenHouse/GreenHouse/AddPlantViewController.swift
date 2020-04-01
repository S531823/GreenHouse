//
//  AddPlantViewController.swift
//  GreenHouse
//
//  Created by student on 2/25/20.
//  Copyright © 2020 S531823. All rights reserved.
//

import UIKit

class AddPlantViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var speciesTF: UITextField!
    @IBOutlet weak var waterFrequencyTF: UITextField!
    @IBOutlet weak var sunlightDurationTF: UITextField!
    @IBOutlet weak var waterTimeFramePV: UIPickerView!
    @IBOutlet weak var sunlightTimeFramePV: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.waterTimeFramePV.delegate = self
        self.waterTimeFramePV.dataSource = self
        self.sunlightTimeFramePV.delegate = self
        self.sunlightTimeFramePV.dataSource = self
    }

    let frequency = ["day", "week", "month", "year"]
    
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
    
    @IBAction func addPlant(sender:Any){
        if Int(waterFrequencyTF.text!) != nil && Int(sunlightDurationTF.text!) != nil {
            let plant = Plant(name: nameTF.text!, species: speciesTF.text!, waterFrequency: Int(waterFrequencyTF.text!)!, waterTimeFrame: waterFreq, sunlightDuration: Int(sunlightDurationTF.text!)!, sunlightTimeFrame: sunlightFreq)
            Plants.shared.add(plant: plant)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Added Plant"), object: nil)
            let notificationScheduler = NotificationScheduler.init(waterFrequancy: Int(waterFrequencyTF.text!)! , waterTimeFrame: waterFreq, sunlightDuration: Int(sunlightDurationTF.text!)!, sunlightTimeFrame: sunlightFreq)
            notificationScheduler.schedule();
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancel(sender:Any){
        self.dismiss(animated: true, completion: nil)
    }
    
}
