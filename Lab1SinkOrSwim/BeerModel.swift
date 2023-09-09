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
    
    func updateMessage(num:Int){
        beerCount = num
        message = "You drank \(num) beers today"
    }
}
