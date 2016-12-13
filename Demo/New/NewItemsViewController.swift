//
// Created by Jakub Kuzimski on 13.12.2016.
// Copyright (c) 2016 Jakub Kuzimski. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView?
    var items: [NewItemModel]? {
        didSet {
            tableView!.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        NewItemsClient.fetchItems {
            (items: [NewItemModel]) in
            self.items = items
        }
    }
}

extension NewItemViewController: UITableViewDataSource {

    //MARK: UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let items = items else {
            return 0
        }
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newReuseIdentifier", for: indexPath);
        if let textLabel = cell.textLabel {
            textLabel.text = "\(indexPath.row): New item"
        }
        return cell
    }
}
