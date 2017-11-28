//
//  LightsTableViewCell.swift
//  LightControl
//
//  Created by Fodé Guirassy on 20/11/2017.
//  Copyright © 2017 Fodé Guirassy. All rights reserved.
//

import UIKit
import Firebase

class LightsTableViewCell: UITableViewCell {

    @IBOutlet var lightPositionLabel: UILabel!
    @IBOutlet weak var lightImage: UIImageView!
    @IBOutlet weak var lightSwitch: UISwitch!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func touchSwitchLight(_ sender: Any) {
        if(lightSwitch.isOn){
            self.lightImage.image = UIImage(named:"light_on.png")
        }else{
            self.lightImage.image = UIImage(named:"light_off.png")
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
