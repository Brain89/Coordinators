import Foundation

class CardListPresenter {
    
    weak var view: CardListViewInput?
    
    fileprivate var cards: [Card] = []
    
    // MARK: - Lifecycle
    
    init(
        view: CardListViewInput
    ) {
        self.view = view
    }
}

extension CardListPresenter: CardListViewOutput {
    
    func didLoadView() {
        view?.update(with: cards)
    }
}

extension CardListPresenter: CardListInput {
    
    func update(with cards: [Card]) {
        self.cards = cards
        view?.update(with: cards)
    }
}
