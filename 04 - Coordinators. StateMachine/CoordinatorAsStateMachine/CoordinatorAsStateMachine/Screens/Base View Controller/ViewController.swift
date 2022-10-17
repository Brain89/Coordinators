import UIKit

class ViewController: UIViewController {
  
    override init(
        nibName nibNameOrNil: String?,
        bundle nibBundleOrNil: Bundle?
    ) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        let allButton = UIBarButtonItem(
            title: "All",
            style: .plain,
            target: self,
            action: #selector(allTapped)
        )
        
        navigationItem.rightBarButtonItem = allButton
        navigationItem.setHidesBackButton(true, animated: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func allTapped() {
        NotificationCenter.default.post(
            name: Notifications.All,
            object: nil
        )
    }
}
