//
// Created by Jakub Kuzimski on 13.12.2016.
// Copyright (c) 2016 Jakub Kuzimski. All rights reserved.
//

import Foundation

class HeterogeneousCollection {

    fileprivate let strategy: Strategy
    fileprivate var collection: [Proxy] = [Proxy]()
    fileprivate var modelToProxyMappings: [String: Proxy.Type] = [String: Proxy.Type]()

    var count: Int {
        get {
            return collection.count
        }
    }

    init(with strategy: Strategy) {
        self.strategy = strategy
    }

    public func register(proxyClass: Proxy.Type, for model: Model.Type) {
        modelToProxyMappings[String(describing: model.self)] = proxyClass
    }

    public func fetch(completion: () -> Void) {
        strategy.fetch {
            (models: [Model]) in
            wrap(models: models)
            completion()
        }
    }

    public func proxy(at: Int) -> Proxy {
        return collection[at]
    }

    fileprivate func wrap(models: [Model]) {
        for model in models {
            let proxyClass = modelToProxyMappings[String(describing: type(of: model))]! as Proxy.Type
            let proxy = proxyClass.init(with: model)
            collection.append(proxy)
        }
    }
}
