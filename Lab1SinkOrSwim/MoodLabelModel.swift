//
//  MoodLabelModel.swift
//  Lab1SinkOrSwim
//
//  Created by Reece Iriye on 9/14/23.
//

import UIKit

class MoodLabelModel: NSObject {
    var happy: Bool = true
    var message: String = "😁"
    
    func updateEmoji() {
        if happy {
            happy = false
            message = "😢"
        } else {
            happy = true
            message = "😁"
        }
    }
}
