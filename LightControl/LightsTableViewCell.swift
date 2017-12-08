//
//  LightsTableViewCell.swift
//  LightControl
//
//  Created by Fodé Guirassy on 20/11/2017.
//  Copyright © 2017 Fodé Guirassy. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class LightsTableViewCell: UITableViewCell {

    @IBOutlet var lightPositionLabel: UILabel!
    @IBOutlet weak var lightImage: UIImageView!
    @IBOutlet weak var lightSwitch: UISwitch!
    
    
    var ref: DatabaseReference!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    @IBAction func touchSwitchLight(_ sender: Any) {
        
        self.ref = Database.database().reference()
        
        guard
            let positionText = self.lightPositionLabel.text else {
                return
        }
        
        if(lightSwitch.isOn){
            self.lightImage.image = UIImage(named:"light_on.png")
            self.ref.child("light").updateChildValues(["/"+positionText: ["isOn": true]])
        }else{
            self.lightImage.image = UIImage(named:"light_off.png")
            self.ref.child("light").updateChildValues(["/"+positionText: ["isOn": false]])
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
