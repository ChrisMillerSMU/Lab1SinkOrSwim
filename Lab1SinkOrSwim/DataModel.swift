//
//  DataModel.swift
//  Lab1SinkOrSwim
//
//  Created by Chris Miller on 9/13/23.
//

import UIKit


class DataModel: NSObject {
    // Shared instance
    public static let shared = DataModel()
    
    // local variables
    private var tableData: [brewery] = [brewery]()
    private var count = 0
    private var name:String = ""
    private var labelData:[String] = [String]()
    private var pickerData:[String] = [String]()
    private var url:URL?

    // Brewery structure
    struct brewery: Decodable, Equatable {
        var name:String
        var street:String?
        var postal_code:String?;
        var phone:String?
        var website_url:String?
        var city:String?
        var brewery_type:String?
    }
    
    // Creates url for api query
    func setURL(breweryCount: Int, isMicroBrewery: Bool){
        if isMicroBrewery {
            url = URL(string: "https://api.openbrewerydb.org/v1/breweries?per_page=\(breweryCount)&page=1&by_type=micro&by_type=nano&by_type=regional&by_type=micro&by_dist=32.84431,-96.78371")!
        } else {
            url = URL(string: "https://api.openbrewerydb.org/v1/breweries?per_page=\(breweryCount)&page=1&by_dist=32.84431,-96.78371")!
        }
        
        setData()
    }
    
    // Sets tableData to querried data
    func setData(){
        self.tableData = []
        
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            if let data = data {
                self.tableData = try! JSONDecoder().decode([brewery].self, from: data)
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
        task.resume()
        
        // Hold program until table data updates
        while(self.tableData == []){ }
    }
    
    // TableData getters + setters
    func getData() -> [brewery]{
        return tableData
    }
    
    func getDataLength() -> Int{
        return tableData.count
    }
    
    func getDatapoint(index:Int) -> brewery{
        return tableData[index]
    }
    
    // Picker data getters and setters
    func setPickerData(inBrew:brewery){
        let selection = Mirror(reflecting: inBrew)  // Makes iterable keys and values for struct var
        labelData = []
        pickerData = []
        
        // Loop over variable types in str
        for child in selection.children {
            if let castValue = child.value as? Optional<String> {
                // Required `nil` check in case API returned a NaN value (e.g. no address)
                if(castValue != nil){
                    let finalValue = castValue!.replacingOccurrences(of: "_", with: " ")
                    let finalLabel = child.label!.replacingOccurrences(of: "_", with: " ")
                    
                    // Name display on top and no website capitalization for picker
                    if finalLabel == "name" {
                        name = finalValue.capitalized
                    } else if finalLabel == "website url" {
                        pickerData.append(finalValue)
                        labelData.append(finalLabel.capitalized)
                    } else {
                        pickerData.append(finalValue.capitalized)
                        labelData.append(finalLabel.capitalized)
                    }
                }
            }
        }
    }
    
    // More getters and setters
    
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
