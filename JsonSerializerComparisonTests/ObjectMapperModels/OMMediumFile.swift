//
//  OMMediumFile.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder Dev on 1/17/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import Foundation
import ObjectMapper

public class OMMediumFile: MediumFile, Mappable {
    public var om_metaData: OMMetadata? { didSet { meta = om_metaData } }
    public var om_data: [OMSimpleData] = [] { didSet { data = om_data } }

    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        om_metaData     <- map["meta"]
        om_data         <- map["data"]
    }

}

public class OMMetadata: Metadata, Mappable {
    public var om_symbols: [OMSymbol] = [] { didSet { symbols = om_symbols } }
    
    required public init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        command     <- map["command"]
        om_symbols  <- map["symbols"]
        expression  <- map["expression"]
        status      <- map["status"]
        requestId   <- map["requestId"]
    }
    
}

public class OMSymbol: Symbol, Mappable {

    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        symbol      <- map["symbol"]
        market        <- map["market"]
    }
    
}

public class OMSimpleData: SimpleData, Mappable {
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
