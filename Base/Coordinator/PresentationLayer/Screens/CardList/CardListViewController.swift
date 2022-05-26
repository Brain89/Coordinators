import UIKit

class CardListViewController: UIViewController {
    
    weak var output: CardListOutput?
    
    fileprivate var cards: [Card]
    fileprivate lazy var tableData: TableViewDataSource = TableViewDataSource.make(for: cards)
    
    // MARK: - Subviews
    
    fileprivate lazy var cardsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        
        tableView.register(CardTableViewCell.self)
        
        return tableView
    }()
    
    // MARK: - Lifecycle
    
    init(cards: [Card]) {
        self.cards = cards
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Cards list"
        
        view.addSubview(cardsTableView)
        tuneTableView()
    }
    
    // MARK: - Private
    
    private func tuneTableView() {
        cardsTableView.dataSource = tableData
        cardsTableView.delegate = self
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            cardsTableView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            cardsTableView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            cardsTableView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            cardsTableView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
        ])
    }
}

extension CardListViewController: UITableViewDelegate {
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let card = cards[indexPath.row]
        output?.didSelect(card: card)
        
        cardsTableView.deselectRow(
            at: indexPath,
            animated: true
        )
    }
}

extension CardListViewController: UpdateableWithCard {
    
    func update(with card: Card) {
        guard let index = cards.firstIndex(where: { $0.number == card.number }) else { return }
        cards[index] = card
        
        tableData = TableViewDataSource.make(for: cards)
        cardsTableView.dataSource = tableData
        cardsTableView.reloadData()
    }
}
