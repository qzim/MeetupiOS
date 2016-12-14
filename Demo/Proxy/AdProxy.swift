//
// Created by Jakub Kuzimski on 14.12.2016.
// Copyright (c) 2016 Jakub Kuzimski. All rights reserved.
//

import UIKit

class AdProxy: Proxy {

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "adReuseIdentifier", for: indexPath);
        if let textLabel = cell.textLabel {
            textLabel.text = "\(indexPath.row): Ad"
        }
        return cell
    }
}
