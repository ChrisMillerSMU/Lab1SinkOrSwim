//
//  popupViewController.swift
//  Lab1SinkOrSwim
//
//  Created by Chris Miller on 9/6/23.
//

import UIKit

class popupViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Declarations
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var picker: UIPickerView!
    
    let localData = DataModel.shared
    
    struct brewery: Decodable, Equatable {
        var name:String
        var street:String?
        var postal_code:String?;
        var phone:String?
        var website_url:String?
        var city:String?
        var brewery_type:String?
    }
    
    // View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.picker?.delegate = self
        self.picker?.dataSource = self
        
        dataLabel.text = localData.getValue(index: 0)
    }
    
    // Close Pupup
    @IBAction func closePopup(_ sender: Any) {
        dismiss(animated: true)
    }
    
    // Picker Functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return localData.getPickerCount()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return localData.getLabel(index: row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dataLabel.text = localData.getValue(index: row)
    }
}
