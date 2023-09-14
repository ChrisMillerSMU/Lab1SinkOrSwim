//
//  DataModel.swift
//  Lab1SinkOrSwim
//
//  Created by Chris Miller on 9/13/23.
//

import UIKit
import CoreLocation
class DataModel: NSObject, CLLocationManagerDelegate{
    public static let shared = DataModel()
    
    private var tableData: [brewery] = [brewery]()
    private var count = 0
    private var name:String = ""
    private var location:CLLocation?
    private var labelData:[String] = [String]()
    private var pickerData:[String] = [String]()

    struct brewery: Decodable, Equatable {
        var name:String
        var street:String?
        var postal_code:String?;
        var phone:String?
        var website_url:String?
        var city:String?
        var brewery_type:String?
    }
    
    func setLocation(){
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        
        locationManager.startUpdatingLocation()
        location = locationManager.location!
        print("Got location: " + String(location!.coordinate.latitude) + ", " + String(location!.coordinate.longitude))
        
        setData()
    }
    
    func setData(){
        let url = URL(string: "https://api.openbrewerydb.org/v1/breweries?per_page=25&page=1&by_dist=" + String(format: "%f", location!.coordinate.latitude) + "," + String(format: "%f", location!.coordinate.longitude))!
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                self.tableData = try! JSONDecoder().decode([brewery].self, from: data)
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
        task.resume()
        while(self.tableData == []){ }
    }
    
    func getData() -> [brewery]{
        return tableData
    }
    
    func getDataLength() -> Int{
        return tableData.count
    }
    
    func getDatapoint(index:Int) -> brewery{
        return tableData[index]
    }
    
    func setPickerData(inBrew:brewery){
        let selection = Mirror(reflecting: inBrew)
        
        for child in selection.children{
            if let castValue = child.value as? Optional<String> {
                let finalValue = castValue!.replacingOccurrences(of: "_", with: " ")
                let finalLabel = child.label!.replacingOccurrences(of: "_", with: " ")
                
                if(finalLabel == "name"){
                    name = finalValue.capitalized
                }
                else if(finalLabel == "website url"){
                    pickerData.append(finalValue)
                    labelData.append(finalLabel.capitalized)
                }
                else{
                    pickerData.append(finalValue.capitalized)
                    labelData.append(finalLabel.capitalized)
                }
            }
        }
    }
    
    func getLabel(index:Int) -> String{
        return labelData[index]
    }
    
    func getValue(index:Int) -> String{
        return pickerData[index]
    }
    
    func getPickerCount() -> Int{
        return pickerData.count
    }
}
