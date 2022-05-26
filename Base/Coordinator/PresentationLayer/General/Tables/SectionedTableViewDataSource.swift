import UIKit

class SectionedTableViewDataSource: NSObject {
    
    fileprivate let dataSources: [UITableViewDataSource]
    
    init(dataSources: [UITableViewDataSource]) {
        self.dataSources = dataSources
    }

}

extension SectionedTableViewDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        dataSources.count
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        let dataSource = dataSources[section]
        return dataSource.tableView(tableView, numberOfRowsInSection: 0)
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let dataSource = dataSources[indexPath.section]
        return dataSource.tableView(tableView, cellForRowAt: indexPath)
    }
}
