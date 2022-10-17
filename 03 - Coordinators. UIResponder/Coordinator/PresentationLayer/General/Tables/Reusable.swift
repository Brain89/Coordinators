import UIKit

protocol ReusableView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        get {
            return String(describing: self)
        }
    }
}

extension UITableViewCell: ReusableView {}

extension UITableView {
    
    func register<Cell: UITableViewCell>(_ cell: Cell.Type) {
        register(
            cell,
            forCellReuseIdentifier: Cell.defaultReuseIdentifier
        )
    }
    
    func dequeueReusableCell<Cell: UITableViewCell> (
        forIndexPath indexPath: IndexPath
    ) -> Cell {
        guard let cell = dequeueReusableCell(
            withIdentifier: Cell.defaultReuseIdentifier,
            for: indexPath
        ) as? Cell else {
            fatalError()
        }
        
        return cell
    }
}
