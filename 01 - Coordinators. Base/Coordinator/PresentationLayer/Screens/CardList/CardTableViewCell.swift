import UIKit

final class CardTableViewCell: ConfigurableCell<Card> {
    
    // MARK: - Initialization

    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(
            style: .subtitle,
            reuseIdentifier: reuseIdentifier
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func configure(_ model: Card) {
        super.configure(model)
        
        textLabel?.text = model.name
        detailTextLabel?.text = model.balance
    }
}
