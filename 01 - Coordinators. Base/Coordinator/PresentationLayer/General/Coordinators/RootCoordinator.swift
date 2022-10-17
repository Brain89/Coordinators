import UIKit

final class RootCoordinator: AppCoordinator {
    
    private weak var transitionHandler: UINavigationController?
    var child: AppCoordinator?
    
    // MARK: - Initialization
    
    init(transitionHandler: UINavigationController) {
        self.transitionHandler = transitionHandler
    }
    
    // MARK: - Public
    
    func start() {
        showCardListScreen()
    }
    
    // MARK: - Private
    
    fileprivate func showCardListScreen() {
        let cards: [Card] = (0...3).map { _ in .fake() }

        let controller = CardListViewController(cards: cards)
        controller.output = self
        
        transitionHandler?.pushViewController(controller, animated: false)
    }
    
    fileprivate func showCardDetails(card: Card) {
        let controller = CardDetailsViewController(card: card)
        controller.output = self
        
        transitionHandler?.pushViewController(controller, animated: true)
    }
    
    fileprivate func startCardSettingsCoordinator(card: Card) {
        let coordinator = CardSettingsCoordinator(transitionHandler: transitionHandler)
        coordinator.output = self
        
        child = coordinator
        
        coordinator.start(card: card)
    }
}

extension RootCoordinator: CardListOutput {
    
    func didSelect(card: Card) {
        showCardDetails(card: card)
    }
}

extension RootCoordinator: CardDetailsOutput {
    
    func didSelect(transaction: Transaction) {
        
    }
    
    func didSelectCardSettings(card: Card) {
        startCardSettingsCoordinator(card: card)
    }
}

extension RootCoordinator: CardSettingsCoordinatorOutput {
    
}
