//
//  BSLargeSimpleArray.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder Dev on 1/17/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import Foundation

public extension LargeSimpleArray {

    convenience init?(dict: [String: Any?]) {
        self.init()
        if let dataDictArray = dict["data"] as? [[String: Any?]] {
            for item in dataDictArray {
                if let value = QuoteEntry(dict: item) {
                    data.append(value)
                }
            }
        }
    }
    public var dict: [String: Any?] {
        var symbolDictArray: [[String:Any?]] = []
        for item in data {
            symbolDictArray.append(item.dict)
        }
        var output: [String: Any?] = [:]
        output["data"] = symbolDictArray
        return output
    }
}

public extension QuoteEntry {

    convenience init?(dict: [String: Any?]) {
        self.init()
        DateTime = dict["DateTime"] as? String
        if let value = dict["Open"] as? [String: Any?] {
            Open = QuoteValue(dict: value)
        }
        if let value = dict["High"] as? [String: Any?] {
            High = QuoteValue(dict: value)
        }
        if let value = dict["Low"] as? [String: Any?] {
            Low = QuoteValue(dict: value)
        }
        if let value = dict["Close"] as? [String: Any?] {
            Close = QuoteValue(dict: value)
        }
        if let value = dict["Volume"] as? [String: Any?] {
            Volume = QuoteValue(dict: value)
        }
    }
    public var dict: [String: Any?] {
        var symbolDict: [String:Any?] = [:]
        symbolDict["DateTime"] = DateTime
        symbolDict["Open"] = Open?.dict
        symbolDict["High"] = High?.dict
        symbolDict["Low"] = Low?.dict
        symbolDict["Close"] = Close?.dict
        symbolDict["Volume"] = Volume?.dict
        return symbolDict
    }
}

public extension QuoteValue {

    convenience init?(dict: [String: Any?]) {
        self.init()
        number = dict["number"] as? Double
        text = dict["text"] as? String
    }
    public var dict: [String: Any?] {
        var symbolDict: [String:Any?] = [:]
        symbolDict["text"] = text
        symbolDict["number"] = number
        return symbolDict
    }
}
