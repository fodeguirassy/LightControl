//
//  LightsTableViewCell.swift
//  LightControl
//
//  Created by Fodé Guirassy on 20/11/2017.
//  Copyright © 2017 Fodé Guirassy. All rights reserved.
//

import UIKit

class LightsTableViewCell: UITableViewCell {

    @IBOutlet var lightPositionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //lightPositionLabel?.text = "Sambarou"
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
