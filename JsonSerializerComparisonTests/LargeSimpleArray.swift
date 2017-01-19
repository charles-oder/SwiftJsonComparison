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
    public var DateTime: String?
    public var Open: QuoteValue?
    public var High: QuoteValue?
    public var Low: QuoteValue?
    public var Close: QuoteValue?
    public var Volume: QuoteValue?
}

public class QuoteValue {
    public var number: Double?
    public var text: String?
}
