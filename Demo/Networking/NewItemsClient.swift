//
// Created by Jakub Kuzimski on 13.12.2016.
// Copyright (c) 2016 Jakub Kuzimski. All rights reserved.
//

import Foundation

class NewItemsClient {

    public static func fetchItems(completion: (_: [NewItemModel]) -> Void) {
        var array = [NewItemModel]()
        for _ in 0...5 {
            array.append(NewItemModel())
        }
        completion(array)
    }
}
