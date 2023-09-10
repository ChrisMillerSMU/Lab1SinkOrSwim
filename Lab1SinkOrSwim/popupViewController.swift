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
    
    var pickerLabels: [String] = [String]()
    var pickerData: [String] = [String]()
//    var selection:brewery = brewery(name:"", address_1:"", postal_code:"", phone:"", website_url:"")
    var selection:brewery = brewery(name:"")
    
//    struct brewery: Decodable {
//        var name:String
//        var address_1:String
//        var postal_code:String
//        var phone:String
//        var website_url:String
//    }
    struct brewery: Decodable {
        var name:String
    }
    
    // View did load
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.picker?.delegate = self
        self.picker?.dataSource = self
        
        pickerLabels = ["Address", "Postal Code", "Phone Number", "Website"]
        pickerData = ["address_1", "postal_code", "phone", "website_url"]
        
        print(selection)
        self.nameLabel?.text = selection.name
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
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerLabels[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        let temp = selection.[pickerData[row]]
//        if (temp != ""){
//            dataLabel.text = pickerData[row]
        }
    }
