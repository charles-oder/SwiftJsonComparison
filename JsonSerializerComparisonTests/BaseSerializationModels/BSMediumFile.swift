//
//  BSMediumFile.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder Dev on 1/17/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import Foundation

public extension MediumFile {
    convenience init?(dict: [String: Any?]) {
        self.init()
        if let metaDict = dict["meta"] as? [String: Any?] {
            metaData = Metadata(dict: metaDict)
        }
        if let dataDictArray = dict["data"] as? [[String: Any?]] {
            data = []
            for item in dataDictArray {
                if let simpleData = SimpleData(dict: item) {
                    data.append(simpleData)
                }
            }
        }
    }
    public var dict: [String: Any?] {
        var dict: [String:Any?] = [:]
        
        if let objectMetadata = metaData {
            dict["meta"] = objectMetadata.dict
        }
        
        var dataDictArray: [[String:Any?]] = []
        for obj in data {
            dataDictArray.append(obj.dict)
        }
        dict["data"] = dataDictArray
        return dict
    }
}

public extension Metadata {
    convenience init?(dict: [String: Any?]) {
        self.init()
        command = dict["command"] as? String
        if let symbolsDictArray = dict["symbols"] as? [[String: Any?]] {
            symbols = []
            for item in symbolsDictArray {
                if let s = Symbol(dict: item) {
                    symbols.append(s)
                }
            }
        }
        expression = dict["expression"] as? String
        status = dict["status"] as? Int
        requestId = dict["requestId"] as? Int
    }
    public var dict: [String: Any?] {
        var metaDict: [String:Any?] = [:]
        metaDict["command"] = command
        var symbolsDictArray: [[String:Any?]] = []
        for symbol in symbols {
            symbolsDictArray.append(symbol.dict)
        }
        metaDict["symbols"] = symbolsDictArray
        metaDict["expression"] = expression
        metaDict["status"] = status
        metaDict["requestId"] = requestId
        return metaDict
    }
}

public extension Symbol {
    convenience init?(dict: [String: Any?]) {
        self.init()
        symbol = dict["symbol"] as? String
        market = dict["market"] as? String
    }
    public var dict: [String: Any?] {
        var symbolDict: [String:Any?] = [:]
        symbolDict["symbol"] = symbol
        symbolDict["market"] = market
        return symbolDict
    }
}

public extension SimpleData {
    convenience init?(dict: [String: Any?]) {
        self.init()
        Last = dict["Last"] as? String
        Change = dict["Change"] as? String
        High = dict["High"] as? String
        Low = dict["Low"] as? String
        Open = dict["Open"] as? String
        Bid = dict["Bid"] as? String
        Ask = dict["Ask"] as? String
        CumVolume = dict["CumVolume"] as? Int
        IssueDescription = dict["IssueDescription"] as? String
        Settledate = dict["Settledate"] as? String
        SettlementPrice = dict["SettlementPrice"] as? String
        ActualSymbol = dict["ActualSymbol"] as? String
        QuoteDelay = dict["QuoteDelay"] as? Int
        TradeDateTime = dict["TradeDateTime"] as? String
        PctChange = dict["PctChange"] as? String
    }
    public var dict: [String: Any?] {
        var dataDict: [String:Any?] = [:]
        dataDict["Last"] = Last
        dataDict["Change"] = Change
        dataDict["High"] = High
        dataDict["Low"] = Low
        dataDict["Open"] = Open
        dataDict["Bid"] = Bid
        dataDict["Ask"] = Ask
        dataDict["CumVolume"] = CumVolume
        dataDict["IssueDescription"] = IssueDescription
        dataDict["Settledate"] = Settledate
        dataDict["SettlementPrice"] = SettlementPrice
        dataDict["ActualSymbol"] = ActualSymbol
        dataDict["QuoteDelay"] = QuoteDelay
        dataDict["TradeDateTime"] = TradeDateTime
        dataDict["PctChange"] = PctChange
        return dataDict
    }
}
