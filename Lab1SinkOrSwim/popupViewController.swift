//
//  popupViewController.swift
//  Lab1SinkOrSwim
//
//  Created by Chris Miller on 9/6/23.
//

import UIKit

class popupViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    struct brewery: Decodable {
        var name: String
    }
    
    // Declarations
    @IBOutlet weak var breweryPicker: UIPickerView?
    @IBOutlet weak var dataLabel: UILabel!
    var pickerData: [String] = [String]()
    
    // View did load
    override func viewDidLoad() {
        pickerData = []
        let url = URL(string: "https://api.openbrewerydb.org/v1/breweries")!
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let breweries = try? JSONDecoder().decode([brewery].self, from: data) {
                    for brewery in breweries{
                        self.pickerData.append(brewery.name)
                    }
                }
                else {
                   print("Invalid Response")
               }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }

        task.resume()
        
        self.breweryPicker?.delegate = self
        self.breweryPicker?.dataSource = self
        
        super.viewDidLoad()
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
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dataLabel.text = pickerData[row]
    }
    
}
