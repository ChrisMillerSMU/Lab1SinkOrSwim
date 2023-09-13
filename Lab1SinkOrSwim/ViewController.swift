//
//  ViewController.swift
//  Lab1SinkOrSwim
//
//  Created by Chris Miller on 8/30/23.
//

import UIKit

class ViewController: UIViewController {
    var size = 0
    //@IBOutlet var tableView: UITableView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var scrollViewer: UIScrollView!
    
    @IBOutlet weak var changedSize: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.delegate = self
        //tableView.dataSource = self
        //tableView.isScrollEnabled = false
        //scrollViewer.delegate = self
        //scrollViewer.maximumZoomScale = 5.0
    }

    @IBAction func changedSize(_ sender: Any) {
        switch changedSize.selectedSegmentIndex{
        case 0:
            size = 0
            print("option 0")
        case 1:
            size = 1
            print("option 1")
        default:
            break
        }

        
        
    }

    @IBOutlet weak var imageViews: UIView!
    
    
}

let breweries = [
"Good Brewery",
"Alright Brewery",
"Bad Brewery",
"Great Brewery",
"9",
"1",
"2",
"3",
"4",
"5",
"6",
"7",
"8",
"9",
"10",
"11",
"12",
"13",
"14",
"15",
]

    
extension ViewController: UITableViewDelegate {
    
}
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("hello")
        return breweries.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = breweries[indexPath.row]
        return cell
    }

}

extension ViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageViews
    }
}


//func scrollViewDidScroll(_ scrollView: UIScrollView) {
//    if scrollView == self.scrollView {
//        tableView.isScrollEnabled = (self.scrollView.contentOffset.y >= 200)
//    }
//
//    if scrollView == self.tableView {
//        self.tableView.isScrollEnabled = (tableView.contentOffset.y > 0)
//    }
//}
