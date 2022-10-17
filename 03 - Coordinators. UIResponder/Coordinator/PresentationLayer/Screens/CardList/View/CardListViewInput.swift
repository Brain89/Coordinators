import Foundation

protocol CardListViewInput: AnyObject {
    
    func update(with cards: [Card])
}
