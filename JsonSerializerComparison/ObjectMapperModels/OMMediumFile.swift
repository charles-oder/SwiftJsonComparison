//
//  OMMediumFile.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder Dev on 1/17/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import Foundation
import ObjectMapper

public class OMMediumFile: Mappable {
    
    public var meta: OMMetadata?
    public var data: [OMSimpleData] = []

    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        meta     <- map["meta"]
        data         <- map["data"]
    }

}

public class OMMetadata: Mappable {

    public var command: String?
    public var symbols: [OMSymbol] = []
    public var expression: String?
    public var status: Int?
    public var requestId: Int?

    required public init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        command     <- map["command"]
        symbols  <- map["symbols"]
        expression  <- map["expression"]
        status      <- map["status"]
        requestId   <- map["requestId"]
    }
    
}

public class OMSymbol: Mappable {

    public var symbol: String?
    public var market: String?

    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        symbol      <- map["symbol"]
        market      <- map["market"]
    }
    
}

public class OMSimpleData: Mappable {
    
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

    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        Last      <- map["Last"]
        Change      <- map["Change"]
        High      <- map["High"]
        Low      <- map["Low"]
        Open      <- map["Open"]
        Bid      <- map["Bid"]
        Ask      <- map["Ask"]
        CumVolume      <- map["CumVolume"]
        IssueDescription      <- map["IssueDescription"]
        Settledate      <- map["Settledate"]
        SettlementPrice      <- map["SettlementPrice"]
        ActualSymbol      <- map["ActualSymbol"]
        QuoteDelay      <- map["QuoteDelay"]
        TradeDateTime      <- map["TradeDateTime"]
        PctChange      <- map["PctChange"]
    }
    
}
