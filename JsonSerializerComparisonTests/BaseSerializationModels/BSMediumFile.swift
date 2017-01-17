//
//  BSMediumFile.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder Dev on 1/17/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import Foundation

public extension MediumFile {    
    public var dict: [String: Any?] {
        get {
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
        set {
            
        }
    }
}

public extension Metadata {
    public var dict: [String: Any?] {
        get {
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
        set {
            
        }
    }
}

public extension Symbol {
    public var dict: [String: Any?] {
        get {
            var symbolDict: [String:Any?] = [:]
            symbolDict["symbol"] = symbol
            symbolDict["market"] = market
            return symbolDict
        }
        set {
            
        }
    }
}

public extension SimpleData {
    public var dict: [String: Any?] {
        get {
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
        set {
            
        }
    }
}
