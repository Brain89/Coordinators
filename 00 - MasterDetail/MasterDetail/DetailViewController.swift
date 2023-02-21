import UIKit

protocol DetailViewControllerDelegate: AnyObject {
    
    func didSelectText(
        _ sender: DetailViewController,
        text: String
    )
}

final class DetailViewController: UIViewController {
    
    weak var delegate: DetailViewControllerDelegate?
    
    private lazy var actionButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Action", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18.0)
        button.layer.cornerRadius = 6.0
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.red.cgColor
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Detail"
        view.backgroundColor = .systemGreen
        
        view.addSubview(actionButton)
        
        NSLayoutConstraint.activate([
            actionButton.heightAnchor.constraint(equalToConstant: 44.0),
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -44.0),
            actionButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 44.0),
            actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -44.0),
        ])
        
        actionButton.addTarget(
            self,
            action: #selector(buttonTouched(_ :)),
            for: .touchUpInside
        )
    }
    
    @objc func buttonTouched(_ sender: UIButton) {
        delegate?.didSelectText(
            self,
            text: "Button touched"
        )
    }
}
