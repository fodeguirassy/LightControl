//
//  LightsViewController.swift
//  LightControl
//
//  Created by Fodé Guirassy on 20/11/2017.
//  Copyright © 2017 Fodé Guirassy. All rights reserved.
//

import UIKit

class LightsViewController: UIViewController {
    
    @IBOutlet weak var lightsTableView: UITableView!
    

    
    let lights: [Light] = [Light(position:"Room", isOn:false), Light(position:"Living Room", isOn:false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

