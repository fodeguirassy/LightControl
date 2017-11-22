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
    var lightName: String
    
    init(position: String, isOn: Bool, lightName: String) {
        self.position = position
        self.isOn = isOn
        self.lightName = lightName
    }

}
