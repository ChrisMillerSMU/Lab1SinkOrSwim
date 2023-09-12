//
//  BeerModel.swift
//  Lab1SinkOrSwim
//
//  Created by Reece Iriye on 9/9/23.
//

import UIKit

class BeerModel: NSObject {
    var beerCount: Int = 0
    var message: String = "You drank 0 beers today"
    
    func updateMessage(num:Int) -> Bool{
        var increased: Bool
        if num > beerCount{
            increased = true
        }
        else{
            increased = false
        }
        beerCount = num
        message = "You drank \(num) beers today"
        return increased
    }
}
