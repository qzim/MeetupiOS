//
// Created by Jakub Kuzimski on 14.12.2016.
// Copyright (c) 2016 Jakub Kuzimski. All rights reserved.
//

import Foundation

class SearchStrategy: Strategy {

    public func fetch(completion: (_: [Model]) -> Void) {
        SearchItemsClient.fetchItems {
            (items: [SearchItemModel]) in
            AdClient.fetchAds { (ads: [AdModel]) in
                let mergedContent = merge(items: items, ads: ads)
                completion(mergedContent)
            }
        }
    }

    fileprivate func merge(items: [Model], ads: [Model]) -> [Model] {
        var array = items
        array.insert(ads.first!, at: 2)
        array.insert(ads[1], at: 5)
        return array
    }
}
