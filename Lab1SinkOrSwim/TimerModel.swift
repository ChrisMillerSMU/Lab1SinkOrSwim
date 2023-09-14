//
//  TimerModel.swift
//  Lab1SinkOrSwim
//
//  Created by Reece Iriye on 9/11/23.
//
import Foundation
import UIKit

class TimerModel: NSObject {
    private var remainingTime: TimeInterval = 0
    var timeDisplay: String = "00:00:00"
    
    func editTime(withInterval interval: TimeInterval){
        remainingTime += interval
    }
    
    func changeDisplay(){
        let time = NSInteger(remainingTime)
        let seconds = time % 60
        let minutes = (time/60) % 60
        let hours = (time/3600)
        
        timeDisplay = String(format:"%0.2d:%0.2d:%0.2d", hours, minutes, seconds)
    }
    
    func decrementRemainingTime() {
        remainingTime -= 1
    }
    
    func setRemainingTime(withInterval interval: TimeInterval){
        remainingTime = interval
    }
    
    func getRemainingTime() -> TimeInterval {
        return remainingTime
    }
    
}
