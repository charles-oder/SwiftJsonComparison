//
//  MediumFile.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder Dev on 1/17/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import Foundation

public class MediumFile {
    public var meta: Metadata?
    public var data: [SimpleData] = []
}

public class Metadata {
    public var command: String?
    public var symbols: [Symbol] = []
    public var expression: String?
    public var status: Int?
    public var requestId: Int?

}

public class Symbol {
    public var symbol: String?
    public var market: String?
}

public class SimpleData {
    public var Last: String?
    public var Change: String?
    public var High: String?
    public var Low: String?
    public var Open: String?
    public var Bid: String?
    public var Ask: String?
    public var CumVolume: Int?
    public var IssueDescription: String?
    public var Settledate: String?
    public var SettlementPrice: String?
    public var ActualSymbol: String?
    public var QuoteDelay: Int?
    public var TradeDateTime: String?
    public var PctChange: String?
}
