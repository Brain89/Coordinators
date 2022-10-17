import UIKit

protocol ListViewControllerDelegate: AnyObject {
    
    func listViewController(
        _ listViewController: ListViewController,
        didSelectLanguage selectedLanguage: Language
    )
}

class ListViewController: ViewController {
    
    let list: [Language]
    weak var delegate: ListViewControllerDelegate?
    
    @IBOutlet weak var listTableView: UITableView! {
        didSet {
            listTableView?.dataSource = self
            listTableView?.delegate = self
        }
    }
    
    init(
        list: [Language],
        title: String
    ) {
        self.list = list
        
        super.init(nibName: nil, bundle: nil)
        
        self.title = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        list.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell: UITableViewCell
        
        if let dequeuedCell = tableView.dequeueReusableCell(
            withIdentifier: "ListItem"
        ) {
            cell = dequeuedCell
        } else {
            cell = UITableViewCell(
                style: .subtitle,
                reuseIdentifier: "ListItem"
            )
        }
        
        let language = list[indexPath.row]
        cell.textLabel?.text = language.name
        cell.detailTextLabel?.text = language.year
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let language = list[indexPath.row]
        
        delegate?.listViewController(
            self,
            didSelectLanguage: language
        )
        tableView.deselectRow(
            at: indexPath,
            animated: true
        )
    }
}
