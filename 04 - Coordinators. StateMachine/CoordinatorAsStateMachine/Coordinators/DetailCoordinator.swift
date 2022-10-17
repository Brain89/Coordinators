import UIKit

class DetailCoordinator: Coordinator {
    
    private let transitionHandler: UINavigationController
    private var ListCoordinator: AllCoordinator?
    private let language: Language
    
    init(
        transitionHandler: UINavigationController,
        language: Language
    ) {
        self.language = language
        self.transitionHandler = transitionHandler
    }
    
    func start() {
        let detailViewController = DetailViewController(language: language)
        detailViewController.delegate = self
        transitionHandler.pushViewController(
            detailViewController,
            animated: true
        )
    }
}

// MARK: - DetailViewControllerDelegate

extension DetailCoordinator: DetailViewControllerDelegate {}
