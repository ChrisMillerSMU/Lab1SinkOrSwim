//
//  QueryViewController.swift
//  Lab1SinkOrSwim
//
//  Created by Reece Iriye on 9/13/23.
//

import UIKit

class QueryViewController: UIViewController {

    // MARK: IBOutlet declarations
    
    @IBOutlet weak var closedBrewerySwitch: UISwitch!
    @IBOutlet weak var closedBreweryLabel: UILabel!
    
    @IBOutlet weak var brewerySlider: UISlider!
    @IBOutlet weak var breweryLabel: UILabel!
    
    // MARK: Lazy Instantiation
    
    lazy var closedBrewerySwitchModel: ClosedBrewerySwitchModel = {
        return ClosedBrewerySwitchModel()
    }()
    
    lazy var brewerySliderModel: BrewerySliderModel = {
        return BrewerySliderModel()
    }()
    
    lazy var apiRouteModel: ApiRouteModel = {
        return ApiRouteModel.shared
    }()
        
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: IBAction methods
    
    @IBAction func brewerySliderSlid(_ sender: UISlider) {
        brewerySliderModel.updateMessage(num: Int(sender.value))
        updateBrewCountLabel()
    }
    
    
    @IBAction func closedBrewerySwitchPressed(_ sender: Any) {
        closedBrewerySwitchModel.updateMessage()
        updateClosedBrewerySwitch()
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        DataModel.shared.setURL(breweryCount: Int(brewerySlider.value), isClosedBrewery: closedBrewerySwitch.isOn)
    }
    
    // MARK: Switch & Slider Controller Logic
    
    func updateClosedBrewerySwitch() {
        closedBreweryLabel.text = closedBrewerySwitchModel.message
    }
    
    func updateBrewCountLabel() {
        breweryLabel.text = brewerySliderModel.message
    }

}
