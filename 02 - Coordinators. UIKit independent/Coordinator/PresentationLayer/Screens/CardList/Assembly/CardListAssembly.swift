import Foundation

final class CardListAssembly {
    
    func create(
        output: CardListOutput,
        serviceLocator: ServiceLocator
    ) -> CardListViewController {
        
        let view = CardListViewController()
        let presenter = CardListPresenter(
            output: output,
            view: view
        )
        
        view.output = presenter
        
        return view
    }
}
