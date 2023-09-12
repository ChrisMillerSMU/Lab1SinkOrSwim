//
//  ViewController.swift
//  Lab1SinkOrSwim
//
//  Created by Chris Miller on 8/30/23.
//

import UIKit


class ViewController: UIViewController, UIScrollViewDelegate {
    // Set initial size equal to zero
    var size:Int = 0
    var timer: Timer?

    
    lazy var logoModel: LogoModel = {
        // Use the sharedInstance from Singleton class for lazy instantiation
        return LogoModel.sharedInstance()
    }()
    
    lazy private var logoView: UIImageView? = {
        // Return our UIImage view representing the logo in this closure with lazy instantiation
        return UIImageView.init(
            image: self.logoModel.getImageWithName(self.logoName)
        )
    }()
    
    // Name for the logo we are putting on the home page
    private var logoName:String = "logo"
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet var tableView: UITableView?
    @IBOutlet weak var changedSize: UISegmentedControl!
    
    @IBOutlet weak var beerCountStepper: UIStepper!
    @IBOutlet weak var beerCountLabel: UILabel!
    
    @IBOutlet weak var closedBrewerySwitch: UISwitch!
    @IBOutlet weak var closedBreweryLabel: UILabel!
    
    @IBOutlet weak var brewerySlider: UISlider!
    @IBOutlet weak var breweryLabel: UILabel!
    
    
    @IBOutlet weak var driveTimerLabel: UILabel!
    @IBOutlet weak var driverTextLabel: UILabel!
    
    lazy var beerModel: BeerModel = {
        return BeerModel()
    }()
    
    lazy var closedBrewerySwitchModel: ClosedBrewerySwitchModel = {
        return ClosedBrewerySwitchModel()
    }()
    
    lazy var brewerySliderModel: BrewerySliderModel = {
        return BrewerySliderModel()
    }()
    
    lazy var timerModel: TimerModel = {
        return TimerModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { _, _ in}
        
        // Set maximum value for beerCountStepper
        beerCountStepper.maximumValue = 100
        
        // Set necessary scrollView values
        if let scrollViewSize = self.logoView?.image?.size {
            self.scrollView.addSubview(self.logoView!)
            self.scrollView.contentSize = scrollViewSize
            self.scrollView.minimumZoomScale = 0.01
            self.scrollView.delegate = self  // knows the User is the scrollView delegate
        }
        
        // Declare the table view
        tableView?.delegate = self  // knows the User is the tableView delegate
        tableView?.dataSource = self  //  knows that the program supplies the
        //tableView.isScrollEnabled = false
    }
    
    
    @IBAction func brewerySliderSlid(_ sender: UISlider) {
        brewerySliderModel.updateMessage(num: Int(sender.value))
        updateBrewCountLabel()
    }
    
    
    @IBAction func closedBrewerySwitchPressed(_ sender: Any) {
        closedBrewerySwitchModel.updateMessage()
        updateClosedBrewerySwitch()
    }
    
    
    @IBAction func beerStepperPressed(_ sender: UIStepper) {
        var increased = beerModel.updateMessage(num: Int(sender.value))
        updateBeerCountLabel()
        if timer == nil{
            startTimer()
        }
        else if(increased){
            timerModel.editTime(withInterval: 3600)
        }
        else{
            timerModel.editTime(withInterval: -3600)
        }
    }

    
    func updateBrewCountLabel() {
        breweryLabel.text = brewerySliderModel.message
    }
    
    
    func updateClosedBrewerySwitch() {
        closedBreweryLabel.text = closedBrewerySwitchModel.message
    }
    
    
    func updateBeerCountLabel() {
        beerCountLabel.text = beerModel.message
    }
    

    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        // Required function for UIScrollView indicating that logoView is dependent on the zooming
        return self.logoView
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        timerModel.editTime(withInterval: 3600)
        driverTextLabel.text = "Time until Driving"
    }
    
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
    
    func stopTimer(){
        timer?.invalidate()
        timer = nil
        timerModel.setRemainingTime(withInterval: 0)
        //call notification
        driverTextLabel.text = "Congrats! you can Drive!"
    }
    
    

    @IBAction func changedSize(_ sender: AnyObject) {
        
        if changedSize.selectedSegmentIndex == 1{
            Swift.print("hello")
        }
        switch sender.selectedSegmentIndex{
        case 0:
            size = 0
            print("size")
        case 1:
            size = 1
            print(size)
        default:
            break
    }

        
        
    }
}

let breweries = [
"Good Brewery",
"Alright Brewery",
"Bad Brewery",
"Great Brewery",
"9",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10",
"11",
"12",
"13",
"14",
"15",
]

    
extension ViewController: UITableViewDelegate {
    
}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("hello")
        return breweries.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = breweries[indexPath.row]
        return cell
    }

}

