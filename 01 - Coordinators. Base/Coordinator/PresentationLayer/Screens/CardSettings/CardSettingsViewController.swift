import UIKit

class CardSettingsViewController: UIViewController {
    
    weak var output: CardSettingsOutput?
    
    fileprivate var card: Card

    // MARK: - Subviews
    
    fileprivate lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.font = UIFont.preferredFont(forTextStyle: .caption1)
        textField.borderStyle = .roundedRect

        return textField
    }()
    
    // MARK: - Lifecycle
    
    init(card: Card) {
        self.card = card
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray2

        title = "Card settings"
        
        view.addSubview(textField)
        tuneTextField()
    }
    
    // MARK: - Private
    
    private func tuneTextField() {
        textField.delegate = self
        textField.text = card.name
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 8.0),
            textField.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor, constant: -8.0),
            textField.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 8.0),
        ])
    }

}

extension CardSettingsViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text {
            card.name = text
            output?.didUpdate(card: card)
        }
        return true
    }
}
