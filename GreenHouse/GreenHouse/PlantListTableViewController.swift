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

    @objc func plantAdded(notification:Notification) {
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Plants.shared.numPlants()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return optimalRowHeight
    }

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
            else { // If the plant has both, combine both with "the" between
                nameLBL.text = plant.name + " the " + plant.species
            }
        }
        return cell
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
