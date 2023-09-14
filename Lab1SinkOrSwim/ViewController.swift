import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    // Set initial pickerMode equal to zero
    var pickerMode:Int = 0
    
    // MARK: Lazily instantiation of variables
    
    lazy var logoModel: LogoModel = {
        // Use the sharedInstance from Singleton class for lazy instantiation
        return LogoModel.sharedInstance()
    }()
    
    lazy var moodLabelModel: MoodLabelModel = {
        // Lazy instantiation
        return MoodLabelModel()
    }()
    
    lazy private var logoView: UIImageView? = {
        // Return our UIImage view representing the logo in this closure with lazy instantiation
        return UIImageView.init(
            image: self.logoModel.getImageWithName("logo")
        )
    }()
    
    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set necessary scrollView values
        if let scrollViewSize = self.logoView?.image?.size {
            self.scrollView.addSubview(self.logoView!)
            self.scrollView.contentSize = scrollViewSize
            self.scrollView.minimumZoomScale = 0.01
            self.scrollView.delegate = self  // knows the User is the scrollView delegate
        }
    }
    
    
    @IBAction func logoPickChange(_ sender: Any) {
        // Make it so the emoji changes
        moodLabelModel.updateEmoji()
        moodLabel.text = moodLabelModel.message
    }
}
