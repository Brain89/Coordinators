import Foundation
import UIKit

protocol Navigation: AnyObject {

	func showModal(
		_ viewController: UIViewController,
		animated: Bool,
        completion: (() -> Void)?
	)
    
    func showModal(
        _ viewController: UIViewController,
        animated: Bool
    )

	func hideAllModals(
		animated: Bool,
		completion: (() -> Void)?
	)
    
    func hideAllModals(
        animated: Bool
    )
}

extension UIViewController: Navigation {
    
    func showModal(
        _ viewController: UIViewController,
        animated: Bool
    ) {
        showModal(
            viewController,
            animated: animated,
            completion: nil
        )
    }
    
	func showModal(
		_ viewController: UIViewController,
		animated: Bool,
		completion: (() -> Void)?
	) {
		present(
            viewController,
            animated: animated,
            completion: completion
        )
	}

	func hideAllModals(
        animated: Bool,
        completion: (() -> Void)?
    ) {
		if presentedViewController != nil {
			dismiss(
                animated: animated,
                completion: completion
            )
		}
	}
    
    func hideAllModals(
        animated: Bool
    ) {
        hideAllModals(
            animated: animated,
            completion: nil
        )
    }
}
