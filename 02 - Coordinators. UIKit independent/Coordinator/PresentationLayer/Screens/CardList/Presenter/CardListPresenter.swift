import Foundation

class CardListPresenter {
    
    weak var output: CardListOutput?
    weak var view: CardListViewInput?
    
    fileprivate var cards: [Card] = []
    
    // MARK: - Lifecycle
    
    init(
        output: CardListOutput,
        view: CardListViewInput
    ) {
        self.output = output
        self.view = view
    }
}

extension CardListPresenter: CardListViewOutput {
    
    func didLoadView() {
        view?.update(with: cards)
    }
    
    func didSelect(card: Card) {
        output?.didSelect(card: card)
    }
}

extension CardListPresenter: CardListInput {
    
    func update(with cards: [Card]) {
        self.cards = cards
        view?.update(with: cards)
    }
}
