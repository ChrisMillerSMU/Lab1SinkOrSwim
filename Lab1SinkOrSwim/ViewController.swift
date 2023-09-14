import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    // Set initial size equal to zero
    var size:Int = 0

    // MARK: Lazily instantiation of variables
    
    lazy var logoModel: LogoModel = {
        // Use the sharedInstance from Singleton class for lazy instantiation
        return LogoModel.sharedInstance()
    }()
    
    lazy private var logoView: UIImageView? = {
        // Return our UIImage view representing the logo in this closure with lazy instantiation
        return UIImageView.init(
            image: self.logoModel.getImageWithName(self.logoName)
        )
    }()
    
    
    
    // Name for the logo we are putting on the home page
    private var logoName:String = "logo"
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet var tableView: UITableView?
    @IBOutlet weak var changedSize: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { _, _ in}
        
        
        
        // Set necessary scrollView values
        if let scrollViewSize = self.logoView?.image?.size {
            self.scrollView.addSubview(self.logoView!)
            self.scrollView.contentSize = scrollViewSize
            self.scrollView.minimumZoomScale = 0.01
            self.scrollView.delegate = self  // knows the User is the scrollView delegate
        }
        
        // Declare the table view
        tableView?.delegate = self  // knows the User is the tableView delegate
        tableView?.dataSource = self  //  knows that the program supplies the
        //tableView.isScrollEnabled = false
    }


    @IBAction func changedSize(_ sender: AnyObject) {
        
        if changedSize.selectedSegmentIndex == 1{
            Swift.print("hello")
        }
        switch sender.selectedSegmentIndex{
        case 0:
            size = 0
            print("size")
        case 1:
            size = 1
            print(size)
        default:
            break
    }
    @IBAction func enterButton(_ sender: Any) {
        
    }
}
