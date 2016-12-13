//
// Created by Jakub Kuzimski on 13.12.2016.
// Copyright (c) 2016 Jakub Kuzimski. All rights reserved.
//

import Foundation

class SearchItemsClient {

    public static func fetchItems(completion: (_: [SearchItemModel]) -> Void) {
        var array = [SearchItemModel]()
        for _ in 0...5 {
            array.append(SearchItemModel())
        }
        completion(array)
    }
}
