//
//  QueryViewController.swift
//  Lab1SinkOrSwim
//
//  Created by Reece Iriye on 9/13/23.
//

import UIKit

class QueryViewController: UIViewController {

    // MARK: IBOutlet declarations
    
    @IBOutlet weak var microBrewerySwitch: UISwitch!
    @IBOutlet weak var microBreweryLabel: UILabel!
    
    @IBOutlet weak var brewerySlider: UISlider!
    @IBOutlet weak var breweryLabel: UILabel!
    
    // MARK: Lazy Instantiation
    
    lazy var microBrewerySwitchModel: MicroBrewerySwitchModel = {
        return MicroBrewerySwitchModel()
    }()
    
    lazy var brewerySliderModel: BrewerySliderModel = {
        return BrewerySliderModel()
    }()
        
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: IBAction methods
    
    @IBAction func brewerySliderSlid(_ sender: UISlider) {
        brewerySliderModel.updateMessage(num: Int(sender.value))
        // Ensure displayed message reflects message in Model
        updateBrewCountLabel()
    }
    
    
    @IBAction func microBrewerySwitchPressed(_ sender: Any) {
        microBrewerySwitchModel.updateMessage()
        updateMicroBrewerySwitch()
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        DataModel.shared.setURL(
            breweryCount: Int(brewerySlider.value),
            isMicroBrewery: microBrewerySwitch.isOn
        )
    }
    
    // MARK: Switch & Slider Controller Logic
    
    func updateMicroBrewerySwitch() {
        // Ensure displayed message reflects message in Model
        microBreweryLabel.text = microBrewerySwitchModel.message
    }
    
    func updateBrewCountLabel() {
        // Ensure displayed message reflects message in Model
        breweryLabel.text = brewerySliderModel.message
    }

}
