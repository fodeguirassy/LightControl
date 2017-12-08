//
//  Light.swift
//  LightControl
//
//  Created by Fodé Guirassy on 20/11/2017.
//  Copyright © 2017 Fodé Guirassy. All rights reserved.
//

import Foundation

class Light {
    
    let position: String
    var isOn: Bool

    
    init(position: String, isOn: Bool) {
        self.position = position
        self.isOn = isOn
    }

}
