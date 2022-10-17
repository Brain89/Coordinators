import Foundation
import UIKit

protocol StackBasedNavigation: Navigation {
    
    var childs: [Any] { get }

	func push(_ viewController: UIViewController, animated: Bool)

	@discardableResult
	func pop(animated: Bool) -> UIViewController?
}

extension UINavigationController: StackBasedNavigation {
    
    var childs: [Any] {
        viewControllers
    }
    
	func push(_ viewController: UIViewController, animated: Bool) {
		pushViewController(viewController, animated: animated)
	}

	func pop(animated: Bool) -> UIViewController? {
		return popViewController(animated: animated)
	}
}
