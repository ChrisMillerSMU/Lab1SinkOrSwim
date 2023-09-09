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
    @IBOutlet weak var brewerySlider: UISlider!
    @IBOutlet weak var breweryLabel: UILabel!
    
    lazy var beerModel: BeerModel = {
        return BeerModel()
    }()
    
    lazy var brewerySliderModel: BrewerySliderModel = {
        return BrewerySliderModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    @IBAction func beerStepperPressed(_ sender: UIStepper){
        beerModel.updateMessage(num: Int(sender.value))
        updateBeerCountLabel()
    }
    
    func updateBeerCountLabel() {
        beerCountLabel.text = beerModel.message
    }
    
    func updateBrewCountLabel(){
        breweryLabel.text = brewerySliderModel.message
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        // Required function for UIScrollView indicating that logoView is dependent on the zooming
        return self.logoView
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

