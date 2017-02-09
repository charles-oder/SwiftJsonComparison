//
//  GLMediumFile.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder Dev on 1/17/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import Foundation
import Gloss

public class GLMediumFile: Glossy {
    
    public var meta: GLMetadata?
    public var data: [GLSimpleData] = []

    required public init?(json: JSON) {
        meta     = "meta" <~~ json
        data         = "data" <~~ json ?? []
    }
    public func toJSON() -> JSON? {
        return jsonify([
            "meta" ~~> meta,
            "data" ~~> data
            ])
    }

}

public class GLMetadata: Glossy {

    public var command: String?
    public var symbols: [GLSymbol] = []
    public var expression: String?
    public var status: Int?
    public var requestId: Int?

    required public init?(json: JSON) {
        command     = "command" <~~ json
        symbols  = "symbols" <~~ json ?? []
        expression  = "expression" <~~ json
        status      = "status" <~~ json
        requestId   = "requestId" <~~ json
    }
    public func toJSON() -> JSON? {
        return jsonify([
            "command" ~~> command,
            "symbols" ~~> symbols,
            "expression" ~~> expression,
            "status" ~~> status,
            "requestId" ~~> requestId
            ])
    }

}

public class GLSymbol: Glossy {

    public var symbol: String?
    public var market: String?

    required public init?(json: JSON) {
        symbol      = "symbol" <~~ json
        market      = "market" <~~ json
    }
    public func toJSON() -> JSON? {
        return jsonify([
            "symbol" ~~> symbol,
            "market" ~~> market
            ])
    }

}

public class GLSimpleData: Glossy {
    
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

    required public init?(json: JSON) {
        Last      = "Last" <~~ json
        Change      = "Change" <~~ json
        High      = "High" <~~ json
        Low      = "Low" <~~ json
        Open      = "Open" <~~ json
        Bid      = "Bid" <~~ json
        Ask      = "Ask" <~~ json
        CumVolume      = "CumVolume" <~~ json
        IssueDescription      = "IssueDescription" <~~ json
        Settledate      = "Settledate" <~~ json
        SettlementPrice      = "SettlementPrice" <~~ json
        ActualSymbol      = "ActualSymbol" <~~ json
        QuoteDelay      = "QuoteDelay" <~~ json
        TradeDateTime      = "TradeDateTime" <~~ json
        PctChange      = "PctChange" <~~ json
    }
    public func toJSON() -> JSON? {
        return jsonify([
            "Last" ~~> Last,
            "Change" ~~> Change,
            "High" ~~> High,
            "Low" ~~> Low,
            "Open" ~~> Open,
            "Bid" ~~> Bid,
            "Ask" ~~> Ask,
            "CumVolume" ~~> CumVolume,
            "IssueDescription" ~~> IssueDescription,
            "Settledate" ~~> Settledate,
            "SettlementPrice" ~~> SettlementPrice,
            "ActualSymbol" ~~> ActualSymbol,
            "QuoteDelay" ~~> QuoteDelay,
            "TradeDateTime" ~~> TradeDateTime,
            "PctChange" ~~> PctChange
            ])
    }

}
