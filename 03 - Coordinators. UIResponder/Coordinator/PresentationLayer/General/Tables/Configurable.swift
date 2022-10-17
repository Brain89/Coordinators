import UIKit

protocol ConfigurableView: AnyObject {
    associatedtype Model
    
    func configure(_ model: Model)
}

class ConfigurableCustomView<Model>: UIView, ConfigurableView {
    
    func configure(_ model: Model) {}
}

class ConfigurableCell<Model>: UITableViewCell, ConfigurableView {
    
    func configure(_ model: Model) {}
}
