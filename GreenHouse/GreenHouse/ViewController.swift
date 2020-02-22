//
//  ViewController.swift
//  GreenHouse
//
//  Created by S531823 on 2/21/20.
//  Copyright © 2020 S531823. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "GreenHouse"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(settings(sender:)))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addPlant(sender:)))
    }
    
    @objc
    func settings(sender: Any) {
        
    }

    @objc
    func addPlant(sender: Any) {
        
    }

}

