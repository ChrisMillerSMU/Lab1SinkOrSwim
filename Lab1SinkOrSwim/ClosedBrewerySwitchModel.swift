//
//  ClosedBrewerySwitchModel.swift
//  Lab1SinkOrSwim
//
//  Created by Reece Iriye on 9/9/23.
//

import UIKit

class ClosedBrewerySwitchModel: NSObject {
    var includeClosedBreweries: Bool = true
    var message: String = "Include Closed Breweries"
    
    func updateMessage() {
        if includeClosedBreweries {
            includeClosedBreweries = false
            message = "Don't Include Closed Breweries"
        } else {
            includeClosedBreweries = true
            message = "Include Closed Breweries"
        }
    }
}
