import UIKit

class TableViewDataSource<Model, Cell: ConfigurableCell<Model>>: NSObject, UITableViewDataSource {
    
    private let models: [Model]
    
    init(
        models: [Model]
    ) {
        self.models = models
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        models.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell: Cell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configure(model)
        return cell
    }
}

extension TableViewDataSource where Model == Card, Cell == CardTableViewCell {
    
    static func make(
        for cards: [Card]
    ) -> TableViewDataSource {
        TableViewDataSource(
            models: cards
        )
    }
}

extension TableViewDataSource where Model == Transaction, Cell == TransactionTableViewCell {
    
    static func make(
        for transactions: [Transaction]
    ) -> TableViewDataSource {
        TableViewDataSource(
            models: transactions
        )
    }
}
