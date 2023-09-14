//
//  BeerCountViewController.swift
//  Lab1SinkOrSwim
//
//  Created by Reece Iriye on 9/13/23.
//

import UIKit

class BeerCountViewController: UIViewController {
    //Create background timer, Outlets for the labels and stepper
    var timer: Timer?
    
    @IBOutlet weak var driveTimerLabel: UILabel!
    @IBOutlet weak var driverTextLabel: UILabel!
    
    @IBOutlet weak var beerCountStepper: UIStepper!
    @IBOutlet weak var beerCountLabel: UILabel!
    
    //Lazily instantiate the Beer Count Model and Timer Model
    lazy var beerModel: BeerModel = {
        return BeerModel()
    }()
    
    lazy var timerModel: TimerModel = {
        return TimerModel()
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set maximum value for beerCountStepper
        beerCountStepper.maximumValue = 100
    }
    
    //Upon stepper press, beer count and timer updates
    @IBAction func beerStepperPressed(_ sender: UIStepper) {
        let increased: Bool = beerModel.updateMessage(num: Int(sender.value))
        updateBeerCountLabel()
        
        // The boolean statement controls adding or subtracting time to reflect beer count increasing or decreasing
        if (timerModel.getRemainingTime() == 0){
            startTimer()
        } else if (increased){
            timerModel.editTime(withInterval: 3600)
        } else{
            timerModel.editTime(withInterval: -3600)
        }
    }
    
    func updateBeerCountLabel() {
        beerCountLabel.text = beerModel.message
    }
    
    // Create the timer if the timer is equal to 0 and update drive label
    func startTimer(){
        timerModel.editTime(withInterval: 3600)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        driverTextLabel.text = "Time Until Driving"
    }
    
    // Decrements internal time remaining variable every second
    @objc private func updateTimer(){
        if timerModel.getRemainingTime() > 0 {
            timerModel.decrementRemainingTime()
        }
        else{
            stopTimer()
        }
        timerModel.changeDisplay()
        driveTimerLabel.text = timerModel.timeDisplay
    }
    
    // Clears out timer once it hits 0, updates label for user
    func stopTimer(){
        timer?.invalidate()
        timer = nil
        timerModel.setRemainingTime(withInterval: 0)
        //call notification
        driverTextLabel.text = "Congrats! you can Drive!"
    }

}
