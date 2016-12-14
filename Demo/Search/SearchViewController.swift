//
// Created by Jakub Kuzimski on 13.12.2016.
// Copyright (c) 2016 Jakub Kuzimski. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    let collection = HeterogeneousCollection(with: SearchStrategy())

    @IBOutlet weak var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()

        collection.register(proxyClass: AdProxy.self, for: AdModel.self)
        collection.register(proxyClass: SearchItemProxy.self, for: SearchItemModel.self)

        collection.fetch { _ in
            tableView!.reloadData()
        }
    }
}

extension SearchViewController: UITableViewDataSource {

    //MARK: UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collection.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let proxy = collection.proxy(at: indexPath.row)
        return proxy.tableView(tableView, cellForRowAt: indexPath)
    }
}
