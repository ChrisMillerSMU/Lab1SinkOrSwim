//
//  BrewerySliderModel.swift
//  Lab1SinkOrSwim
//
//  Created by Reece Iriye on 9/9/23.
//

import UIKit

class BrewerySliderModel: NSObject {
    var breweryCount: Int = 25
    var message: String = "Display up to 25 Nearby Breweries"
    
    func updateMessage(num:Int){
        breweryCount = num
        message = "Display up to \(num) Nearby Breweries"
    }
}

