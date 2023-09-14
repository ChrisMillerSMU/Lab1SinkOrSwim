//
//  ApiRouteModel.swift
//  Lab1SinkOrSwim
//
//  Created by Reece Iriye on 9/13/23.
//

import UIKit

class ApiRouteModel: NSObject {
    
    // Create a SINGLETON class to ensure same API is used across the board
    static let shared = ApiRouteModel()
    
    private override init(){}
    
    // Set string for first API Route
    var apiRoute: String = "https://api.openbrewerydb.org/v1/breweries?per_page=25&page=1&by_dist=32.84431,-96.78371"
    
    func determineApiRoute(breweryCount: Int, isClosedBrewery: Bool) {
        // Example: Build the apiRoute based on the breweryCount and isClosedBrewery values
        if isClosedBrewery {
            apiRoute = "https://api.openbrewerydb.org/v1/breweries?per_page=\(breweryCount)&page=1&by_dist=32.84431,-96.78371"
        } else {
            apiRoute = "https://api.openbrewerydb.org/v1/breweries?per_page=\(breweryCount)&page=1&by_dist=32.84431,-96.78371&by_type=micro&by_type=nano&by_type=regional&by_type=brewpub&by_type=large&by_type=planning&by_type=contract&by_type=proprietor"
        }
    }
}
