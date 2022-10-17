import Foundation

final class CardSettingsCoordinator: AppCoordinator {

    private weak var transitionHandler: StackBasedNavigation?
    private var serviceLocator: ServiceLocator
    
    var childs: [AppCoordinator] = []
    
    weak var output: CardSettingsCoordinatorOutput?
    
    // MARK: - Initialization
    
    init(
        transitionHandler: StackBasedNavigation?,
        serviceLocator: ServiceLocator
    ) {
        self.transitionHandler = transitionHandler
        self.serviceLocator = serviceLocator
    }
    
    // MARK: - Public
    
    func start(card: Card) {
        showCardSettingsScreen(card: card)
    }
    
    // MARK: - Private
    
    fileprivate func showCardSettingsScreen(card: Card) {
        let controller = CardSettingsViewController(card: card)
        controller.output = self
        
        transitionHandler?.showModal(controller, animated: true)
    }
}

extension CardSettingsCoordinator: CardSettingsOutput {
    
    func didUpdate(card: Card) {
        transitionHandler?
            .childs
            .compactMap({ $0 as? UpdateableWithCard})
            .forEach({ controller in
                controller.update(with: card)
            })
        
        transitionHandler?.hideAllModals(animated: true)
    }
}
