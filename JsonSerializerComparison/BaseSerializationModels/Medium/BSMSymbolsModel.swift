// BSMSymbolsModel.swift
// Created by SwiftJsonGenerator https://github.com/charles-oder/SwiftJsonGenerator
// Generated 2017-01-20 19:26:25 +0000

import Foundation

public struct BSMSymbolsModel: JsonModel {

    public let symbol: String?
    public let market: String?

    public init(
                symbol: String?,
                market: String?
                ) {
        self.symbol = symbol
        self.market = market
    }

    public init?(dictionary:[String: Any?]?) {

        self.symbol = dictionary?["symbol"] as? String
        self.market = dictionary?["market"] as? String

    }

    public var jsonDictionary: [String:Any?] {

        var dictionary = [String: Any?]()
        dictionary["symbol"] = self.symbol
        dictionary["market"] = self.market

        return dictionary

    }

}
