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
        dateTime = dict["DateTime"] as? String
        if let value = dict["Open"] as? [String: Any?] {
            open = QuoteValue(dict: value)
        }
        if let value = dict["High"] as? [String: Any?] {
            high = QuoteValue(dict: value)
        }
        if let value = dict["Low"] as? [String: Any?] {
            low = QuoteValue(dict: value)
        }
        if let value = dict["Close"] as? [String: Any?] {
            close = QuoteValue(dict: value)
        }
        if let value = dict["Volume"] as? [String: Any?] {
            volume = QuoteValue(dict: value)
        }
    }
    public var dict: [String: Any?] {
        var symbolDict: [String:Any?] = [:]
        symbolDict["DateTime"] = dateTime
        symbolDict["Open"] = open?.dict
        symbolDict["High"] = high?.dict
        symbolDict["Low"] = low?.dict
        symbolDict["Close"] = close?.dict
        symbolDict["Volume"] = volume?.dict
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
