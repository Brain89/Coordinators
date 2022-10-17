import UIKit

class CardDetailsViewController: UIViewController {
    
    weak var output: CardDetailsOutput?
    
    fileprivate var card: Card
    fileprivate lazy var tableData: TableViewDataSource = TableViewDataSource.make(for: card.transactions)
    
    // MARK: - Subviews
    
    fileprivate lazy var cardDetailView: CardDetailView = {
        let view = CardDetailView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // MARK: - Subviews
    
    fileprivate lazy var transactionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        
        tableView.register(TransactionTableViewCell.self)
        
        return tableView
    }()
    
    fileprivate lazy var settingsButton: UIButton = {
        let button = UIButton.init(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Изменить название карты", for: .normal)
        
        return button
    }()
    
    // MARK: - Initialization
    
    init(card: Card) {
        self.card = card
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Детали карты"
        view.backgroundColor = .systemBackground
        
        view.addSubview(cardDetailView)
        tuneCardDetailView()
        
        view.addSubview(settingsButton)
        tuneSettingsButton()
        
        settingsButton.addTarget(
            self,
            action: #selector(didTapSettingsButton(_:)),
            for: .touchUpInside
        )
        
        view.addSubview(transactionsTableView)
        tuneTransactionsTableView()
    }
    
    // MARK: - Actions
    
    @objc func didTapSettingsButton(_ sender: UIButton) {
        output?.didSelectCardSettings(card: card)
    }
    
    // MARK: - Private
    
    private func tuneCardDetailView() {
        cardDetailView.configure(card)
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            cardDetailView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 8.0),
            cardDetailView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16.0),
            cardDetailView.heightAnchor.constraint(equalToConstant: 180.0),
            cardDetailView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16.0),
        ])
    }
    
    private func tuneSettingsButton() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            settingsButton.topAnchor.constraint(equalTo: cardDetailView.bottomAnchor, constant: 8.0),
            settingsButton.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -16.0),
            settingsButton.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 16.0),
        ])
    }
    
    private func tuneTransactionsTableView() {
        transactionsTableView.dataSource = tableData
        transactionsTableView.delegate = self
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            transactionsTableView.topAnchor.constraint(equalTo: settingsButton.bottomAnchor, constant: 20.0),
            transactionsTableView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            transactionsTableView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            transactionsTableView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
        ])
    }
}

extension CardDetailsViewController: UITableViewDelegate {
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let transaction = card.transactions[indexPath.row]
        output?.didSelect(transaction: transaction)
        
        transactionsTableView.deselectRow(
            at: indexPath,
            animated: true
        )
    }
}

extension CardDetailsViewController: UpdateableWithCard {
    
    func update(with card: Card) {
        self.card = card
        
        cardDetailView.configure(card)
        transactionsTableView.reloadData()
    }
}
