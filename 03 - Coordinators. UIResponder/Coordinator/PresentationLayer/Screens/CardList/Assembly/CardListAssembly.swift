import UIKit

final class CardListAssembly {
    
    func create(
        responder: UIResponder,
        serviceLocator: ServiceLocator
    ) -> CardListViewController {
        
        let view = CardListViewController(
            responder: responder
        )
        let presenter = CardListPresenter(
            view: view
        )
        
        view.output = presenter
        
        return view
    }
}
