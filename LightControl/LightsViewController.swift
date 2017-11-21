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
    
    let lights: [Light] = [Light(position:"Room", isOn:false), Light(position:"Living Room", isOn:false),
        Light(position:"Hall", isOn:false),
        Light(position:"Chiken", isOn:false)]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.lightsTableView.delegate = self
        self.lightsTableView.dataSource = self
        
        //self.lightsTableView.register(LightsTableViewCell.self, forCellReuseIdentifier: "cell")

        self.lightsTableView.register(UINib.init(nibName: "LightsTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }
}

extension LightsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lights.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? LightsTableViewCell else {
            fatalError("FUCKEDDDD UP IOS DEVELOPPING")
        }
        
        cell.lightPositionLabel.text = lights[indexPath.row].position
        return cell
    
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
}

