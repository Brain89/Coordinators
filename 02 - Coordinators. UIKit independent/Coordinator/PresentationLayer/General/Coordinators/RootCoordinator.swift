import Foundation

final class RootCoordinator: AppCoordinator {

    private weak var transitionHandler: StackBasedNavigation?
    private var serviceLocator: ServiceLocator
    
    var childs: [AppCoordinator] = []
    
    // MARK: - Initialization
    
    init(
        transitionHandler: StackBasedNavigation,
        serviceLocator: ServiceLocator
    ) {
        self.transitionHandler = transitionHandler
        self.serviceLocator = serviceLocator
    }
    
    // MARK: - Public
    
    func start() {
        showCardListScreen()
    }
    
    // MARK: - Private
    
    fileprivate func showCardListScreen() {
        let cards: [Card] = (0...3).map { _ in .fake() }

        let screen = CardListAssembly().create(
            output: self,
            serviceLocator: serviceLocator
        )
        
        screen.update(with: cards)
        
        transitionHandler?.push(screen, animated: false)
    }
    
    fileprivate func showCardDetails(card: Card) {
        let controller = CardDetailsViewController(card: card)
        
        controller.output = self
        
        transitionHandler?.push(controller, animated: true)
    }
    
    fileprivate func startCardSettingsCoordinator(card: Card) {
        let coordinator = CardSettingsCoordinator(
            transitionHandler: transitionHandler,
            serviceLocator: serviceLocator
        )
        coordinator.output = self
        childs.append(coordinator)
        
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
