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
        
    }

    @objc
    func addPlant(sender: Any) {
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
