//
//  MicroBrewerySwitchModel.swift
//  Lab1SinkOrSwim
//
//  Created by Reece Iriye on 9/9/23.
//

import UIKit

class MicroBrewerySwitchModel: NSObject {
    var restrictToBreweries: Bool = true
    var message: String = "View Only Micro-Breweries"
    
    func updateMessage() {
        if restrictToBreweries {
            restrictToBreweries = false
            message = "View ALL Breweries"
        } else {
            restrictToBreweries = true
            message = "View Only Micro-Breweries"
        }
    }
}
