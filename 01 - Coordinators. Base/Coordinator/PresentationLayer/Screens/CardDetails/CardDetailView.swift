import UIKit

class CardDetailView: ConfigurableCustomView<Card> {

    // MARK: - Subviews
    
    fileprivate lazy var labelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = .label
        
        return label
    }()
    
    fileprivate lazy var labelNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = .label
        
        return label
    }()
    
    fileprivate lazy var labelBalance: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = .label
        
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(labelName)
        addSubview(labelNumber)
        addSubview(labelBalance)
        
        setupView()
        setupConstraints()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override class var requiresConstraintBasedLayout: Bool {
        true
    }
    
    override func configure(_ model: Card) {
        super.configure(model)
        
        backgroundColor = model.backgroundColor
        labelName.text = model.name
        labelNumber.text = model.number
        labelBalance.text = model.balance
    }
    
    // MARK: - Private
    
    private func setupView() {
        layer.cornerRadius = 8.0;
        layer.masksToBounds = true;
    }
    
    private func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8.0),
            labelName.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8.0),
            labelName.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8.0),
        ])
        
        NSLayoutConstraint.activate([
            labelNumber.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8.0),
            labelNumber.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8.0),
            labelNumber.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8.0),
        ])
        
        NSLayoutConstraint.activate([
            labelBalance.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8.0),
            labelBalance.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8.0),
            labelBalance.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8.0),
        ])
    }

}
