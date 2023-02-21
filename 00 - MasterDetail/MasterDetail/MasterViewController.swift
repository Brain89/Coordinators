import UIKit

class MasterViewController: UIViewController {
    
    private lazy var actionButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show detail", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18.0)
        button.layer.cornerRadius = 6.0
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.red.cgColor
        
        return button
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemRed
        label.text = "Waiting for actions..."
        label.font = UIFont.systemFont(ofSize: 18.0)
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Master"
        view.backgroundColor = .systemYellow
        
        view.addSubview(actionButton)
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            actionButton.heightAnchor.constraint(equalToConstant: 44.0),
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -44.0),
            actionButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 44.0),
            actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -44.0),
        ])
        
        NSLayoutConstraint.activate([
            label.heightAnchor.constraint(equalToConstant: 44.0),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44.0),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 44.0),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -44.0),
        ])
        
        actionButton.addTarget(
            self,
            action: #selector(buttonTouched(_ :)),
            for: .touchUpInside
        )
    }
    
    @objc func buttonTouched(_ sender: UIButton) {
        let detailViewController = DetailViewController()
        detailViewController.delegate = self
        
        navigationController?.pushViewController(
            detailViewController,
            animated: true
        )
    }

}

extension MasterViewController: DetailViewControllerDelegate {
    
    func didSelectText(
        _ sender: DetailViewController,
        text: String
    ) {        
        label.text = text
        label.textColor = .systemBlue
    }
}

