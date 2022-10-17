import UIKit

class AllCoordinator: Coordinator {
    
    private let transitionHandler: UINavigationController
    private let list: [Language]
    private let title: String
    
    private var detailCoordinator: DetailCoordinator?
    
    init(
        transitionHandler: UINavigationController,
        list: [Language],
        title: String
    ) {
        self.transitionHandler = transitionHandler
        self.list = list
        self.title = title
    }
    
    func start() {
        let listViewController = ListViewController(list: list, title: "Список языков")
        listViewController.delegate = self
        transitionHandler.pushViewController(listViewController, animated: true)
    }
}

// MARK: - ListViewControllerDelegate

extension AllCoordinator: ListViewControllerDelegate {
    
    func listViewController(
        _ listViewController: ListViewController,
        didSelectLanguage selectedLanguage: Language
    ) {
        NotificationCenter.default.post(
            name: Notifications.Detail,
            object: selectedLanguage
        )
    }
}
