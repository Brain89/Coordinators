import Foundation
import UIKit

protocol DetailViewControllerDelegate: AnyObject {}

class DetailViewController: ViewController {
    
    let language: Language
    weak var delegate: DetailViewControllerDelegate?
    
    init(language: Language) {
        self.language = language
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = language.color
    }
}
