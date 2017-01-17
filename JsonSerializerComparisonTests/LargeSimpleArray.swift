//
//  LargeSimpleArray.swift
//  JsonSerializerComparison
//
//  Created by Charles Oder Dev on 1/17/17.
//  Copyright © 2017 DTN. All rights reserved.
//

import Foundation

public class LargeSimpleArray {
    public var data = [QuoteEntry]()
}

public class QuoteEntry {
    public var dateTime: String?
    public var open: QuoteValue?
    public var high: QuoteValue?
    public var low: QuoteValue?
    public var close: QuoteValue?
    public var volume: QuoteValue?
}

public class QuoteValue {
    public var number: Double?
    public var text: String?
}
