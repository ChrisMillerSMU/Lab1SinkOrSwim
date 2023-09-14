import UIKit
import CoreLocation

class TablePageViewController: UITableViewController {

    // declarations
    let localData = DataModel.shared
    
    override func viewDidLoad() {
        localData.setLocation()
        
        super.viewDidLoad()
    }
    
    // Table view functions
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return localData.getDataLength()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = localData.getDatapoint(index: indexPath.row)
        var labelString = cellData.name
        var lineCount = 1
        
        if(cellData.city != "Dallas"){
            lineCount += 1
            labelString += "\nCity: \(cellData.city!)"
        }
        if(cellData.brewery_type != "brewpub"){
            lineCount += 1
            labelString += "\nType: \(cellData.brewery_type!)"
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Brewery" + String(lineCount) + "Line", for: indexPath)
        cell.textLabel?.text = labelString
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Breweries"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        localData.setPickerData(inBrew: localData.getDatapoint(index: indexPath.row))
        self.performSegue(withIdentifier: "openPopup", sender: self)
    }
}
