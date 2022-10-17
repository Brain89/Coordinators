import UIKit

final class CardSettingsCoordinator: AppCoordinator {

    private weak var transitionHandler: UINavigationController?
    var child: AppCoordinator?
    weak var output: CardSettingsCoordinatorOutput?
    
    // MARK: - Initialization
    
    init(transitionHandler: UINavigationController?) {
        self.transitionHandler = transitionHandler
    }
    
    // MARK: - Public
    
    func start(card: Card) {
        showCardSettingsScreen(card: card)
    }
    
    // MARK: - Private
    
    fileprivate func showCardSettingsScreen(card: Card) {
        let controller = CardSettingsViewController(card: card)
        controller.output = self
        
        transitionHandler?.present(controller, animated: true)
    }
}

extension CardSettingsCoordinator: CardSettingsOutput {
    
    func didUpdate(card: Card) {
        transitionHandler?
            .viewControllers
            .compactMap({ $0 as? UpdateableWithCard})
            .forEach({ controller in
                controller.update(with: card)
            })
    }
}
