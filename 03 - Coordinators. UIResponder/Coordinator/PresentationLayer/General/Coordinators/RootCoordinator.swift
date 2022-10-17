import UIKit

final class RootCoordinator: UIResponder, AppCoordinator {

    private weak var transitionHandler: UINavigationController?
    private var serviceLocator: ServiceLocator
    
    var childs: [AppCoordinator] = []
    
    // MARK: - Initialization
    
    init(
        transitionHandler: UINavigationController,
        serviceLocator: ServiceLocator
    ) {
        self.transitionHandler = transitionHandler
        self.serviceLocator = serviceLocator
    }
    
    // MARK: - Responder chain
    
    override var next: UIResponder? {
        transitionHandler
    }
    
    // MARK: - Public
    
    func start() {
        showCardListScreen()
    }
    
    // MARK: - Private
    
    fileprivate func showCardListScreen() {
        let cards: [Card] = (0...3).map { _ in .fake() }

        let screen = CardListAssembly().create(
            responder: self,
            serviceLocator: serviceLocator
        )
        
        screen.update(with: cards)
        
        transitionHandler?.pushViewController(screen, animated: true)
    }
    
    fileprivate func showCardDetails(card: Card) {
        let screen = CardDetailsViewController(card: card)
        
        screen.output = self
        
        transitionHandler?.pushViewController(screen, animated: true)
    }
}

extension RootCoordinator {
    
    func handleEvent(_ event: PresentationEvent) -> PresentationEvent? {
        switch event {
        case CardListPresentationEvent.selectCard(let card):
            showCardDetails(card: card)
        default:
            fatalError()
        }
        
        return nil
    }
}

extension RootCoordinator: CardDetailsOutput {
    
    func didSelect(transaction: Transaction) {
    }
    
    func didSelectCardSettings(card: Card) {
    }
}

