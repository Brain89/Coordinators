import Foundation

protocol CardListViewOutput: AnyObject {
    
    func didLoadView()
    func didSelect(card: Card)
}
