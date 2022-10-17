import UIKit

class CoordenableViewController: UIViewController {
    
    // MARK: - Responder

    private(set) weak var responder: UIResponder?

    override var next: UIResponder? {
        return responder ?? super.next
    }
    
    override var canBecomeFirstResponder: Bool {
        true
    }
    
    // MARK: - Lifecycle
    
    init(responder: UIResponder) {
        self.responder = responder
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
