import Foundation

protocol CardDetailsOutput: AnyObject {
    
    func didSelect(transaction: Transaction)
    func didSelectCardSettings(card: Card)
}
