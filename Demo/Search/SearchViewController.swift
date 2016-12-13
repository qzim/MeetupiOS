//
// Created by Jakub Kuzimski on 13.12.2016.
// Copyright (c) 2016 Jakub Kuzimski. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView?
    var items: [SearchItemModel]? {
        didSet {
            tableView!.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        SearchClient.fetchItems {
            (items: [SearchItemModel]) in
            self.items = items
        }
    }
}

extension SearchViewController: UITableViewDataSource {

    //MARK: UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let items = items else {
            return 0
        }
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchReuseIdentifier", for: indexPath);
        if let textLabel = cell.textLabel {
            textLabel.text = "\(indexPath.row): Search item"
        }
        return cell
    }
}
