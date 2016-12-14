//
// Created by Jakub Kuzimski on 13.12.2016.
// Copyright (c) 2016 Jakub Kuzimski. All rights reserved.
//

import Foundation

class AdClient {

    public static func fetchAds(completion: (_: [AdModel]) -> Void) {
        var array = [AdModel]()
        for _ in 0...2 {
            array.append(AdModel())
        }
        completion(array)
    }
}
