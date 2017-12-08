//
//  LightsViewController.swift
//  LightControl
//
//  Created by Fodé Guirassy on 20/11/2017.
//  Copyright © 2017 Fodé Guirassy. All rights reserved.
//

import UIKit
import FirebaseDatabase


class LightsViewController: UIViewController {
    
    @IBOutlet weak var lightsTableView: UITableView!
    
    var ref: DatabaseReference!
    
    var lights: [Light] = [Light(position:"Room", isOn:false),
                           Light(position:"LivingRoom",isOn:false),
                           Light(position:"Hall", isOn:false),
                           Light(position:"Kitchen", isOn:false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lightsTableView.delegate = self
        self.lightsTableView.dataSource = self
        self.lightsTableView.register(UINib.init(nibName: "LightsTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    
        self.ref = Database.database().reference()
        
        for light in self.lights {
            self.ref.child("light/"+light.position).setValue(["isOn": light.isOn])
        }
    
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
        //cell.lightImage.image = UIImage(named: lights[indexPath.row].lightName)
        
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    
    @objc func switchChanged(switch: UISwitch){
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let light = self.lights[indexPath.row]
        if(light.isOn) {
            light.isOn = false
        }else {
            light.isOn = true
        }
        self.ref.child("/lights/"+light.position).updateChildValues(["isOn":light.isOn])
    }
}

