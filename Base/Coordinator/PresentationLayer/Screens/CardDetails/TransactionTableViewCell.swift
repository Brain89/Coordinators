import UIKit

final class TransactionTableViewCell: ConfigurableCell<Transaction> {
    
    // MARK: - Initialization

    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: .subtitle,
            reuseIdentifier: reuseIdentifier
        )
        
        textLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func configure(_ model: Transaction) {
        super.configure(model)
        
        textLabel?.text = model.amount
        detailTextLabel?.text = model.name
    }
}
