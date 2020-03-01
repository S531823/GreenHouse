//
//  PlantsTableViewController.swift
//  GreenHouse
//
//  Created by S531823 on 2/25/20.
//  Copyright © 2020 S531823. All rights reserved.
//

import UIKit

class PlantListTableViewController: UITableViewController {
    
    var plant: Plant!
    
    var plants: [String] = ["Spikey the Cactus", "Lily the Snake Plant", "Yoshi the Yucca"]
    
    let nameLBLTag = 10
    let optimalRowHeight:CGFloat = 100

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "My Plants"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(settings(sender:)))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addPlant(sender:)))
        NotificationCenter.default.addObserver(self, selector: #selector(plantAdded(notification:)), name: NSNotification.Name(rawValue: "Added Plant"), object: nil)
    }

    // Refresh table view after adding a plant
    @objc func plantAdded(notification:Notification) {
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Plants.shared.numPlants()
    }
    
    // Height of each table cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return optimalRowHeight
    }

    // Contents of table cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "plantCell")!
        if let plant = Plants.shared[indexPath.row] {
            let nameLBL = cell.viewWithTag(nameLBLTag) as! UILabel
            
            if plant.name == "" { // If the plant doesn't have a name, only display species
                nameLBL.text = plant.species
            }
            else if plant.species == "" {  // If the plant doesn't have a specified species, only display name
                nameLBL.text = plant.name
            }
            else { // If the plant has both, combine both with "the" in between
                nameLBL.text = plant.name + " the " + plant.species
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let plantInfoViewCont = (storyboard?.instantiateViewController(identifier: Constants.plantInfoViewController) as? PlantInfoViewController)!
        plantInfoViewCont.plant = Plants.shared[indexPath.row]
        navigationController?.pushViewController(plantInfoViewCont, animated: true)
    }

    @objc
    func settings(sender: Any) {
        let settingsViewCont = (storyboard?.instantiateViewController(identifier: Constants.settingsViewController) as? SettingsViewController)!

            //self.present(settingsViewCont, animated: true)
        navigationController?.pushViewController(settingsViewCont, animated: true)
    }

    @objc
    func addPlant(sender: Any) {
        let addPlantViewCont = (storyboard?.instantiateViewController(identifier: Constants.addPlantViewController) as? AddPlantViewController)!

        self.present(addPlantViewCont, animated: true, completion: nil)
    }
    
}
