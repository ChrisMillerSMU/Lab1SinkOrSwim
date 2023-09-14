import UIKit

class TablePageViewController: UITableViewController {

    // declarations
    var tableData: [popupViewController.brewery] = [popupViewController.brewery]()
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://api.openbrewerydb.org/v1/breweries")!
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        // TODO: CHRIS!! THIS IS REECE, HERE IS THE API ROUTE  TO USE (https://api.openbrewerydb.org/v1/breweries?per_page=25&page=1&by_dist=32.84431,-96.78371)
        // FOR THE SWITCH BUTTON WE HAVE IN THE QUERY TO EXCLUDE CLOSED BREWERIES DEPENDING ON THE CLICK, WE NEED AN UPDATE FOLLOWING THIS CONVENTION FOR IT:
        // let openBreweries = breweriesData.filter { $0.brewery_type != "closed" }
        // JUST THAT IN THE CASE THAT THE USER OPTS IN TO INCLUDING BREWERIES THAT STRICTLY ARE NOT CLOSED.
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let breweries = try? JSONDecoder().decode([popupViewController.brewery].self, from: data) {
                    for brewery in breweries{
                        self.tableData.append(brewery)
                        self.count += 1
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
    }
    
    // Table view functions
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BreweryCell", for: indexPath)

        cell.textLabel?.text = "\(tableData[indexPath.row].name)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Breweries"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "openPopup", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let controller = segue.destination as! popupViewController
            controller.selection = tableData[indexPath.row]
        }
    }
}
